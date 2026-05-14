/***************************************************************************//**
 * @file ina228.c
 * @brief TI INA228 I2C access (VBUS, current) using I2CSPM sensor instance.
 ******************************************************************************/
#include "ina228.h"
#include "sl_i2cspm.h"
#include "sl_i2cspm_instances.h"
#include "em_i2c.h"
#include "em_device.h"
#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include "sl_iostream.h"
#include "sl_iostream_handles.h"

#ifndef INA228_APP_SHUNT_OHM
#define INA228_APP_SHUNT_OHM       0.015f
#endif
#ifndef INA228_APP_IMAX_A
#define INA228_APP_IMAX_A          10.0f
#endif

#ifndef INA228_ADCRANGE_LOW
#define INA228_ADCRANGE_LOW  0
#endif

/* ADC config (reg 0x01): slower conversions + averaging reduce open-circuit noise.
 * Layout matches TI INA228 / Adafruit_INA2xx (mode in bits 15:12, avg in 2:0). */
#ifndef INA228_ADCCFG_AVG
#define INA228_ADCCFG_AVG        6u /* 0=1, 1=4 … 6=512, 7=1024 samples */
#endif
#ifndef INA228_ADCCFG_CONV
#define INA228_ADCCFG_CONV       5u /* 0=50us … 7=4120us for VBUS/shunt/temp */
#endif
#ifndef INA228_APP_I_DEADB_UA
/** Report 0 uA when |I| is below this (noise at Imax=10A is ~±20 uA per LSB). Set 0 to show raw. */
#define INA228_APP_I_DEADB_UA    280
#endif
#ifndef INA228_APP_V_DEADB_MV
#define INA228_APP_V_DEADB_MV    25
#endif
#ifndef INA228_APP_VCOM_RATE_HZ
/** VCOM printf rate from `ina228_application_poll` (DWT cycle counter + `SystemCoreClock`). */
#define INA228_APP_VCOM_RATE_HZ  1u
#endif
#ifndef INA228_APP_SHUNT_OVER_ALERT_MA
/** SOVL: alert when load current exceeds this (mA), from Vshunt = I×R and `shunt_resistance_ohm` in init. 0 = off. */
#define INA228_APP_SHUNT_OVER_ALERT_MA  10u
#endif
#ifndef INA228_APP_DIAG_PRINT_CNVRF
/** In `DIAG=` VCOM text, include CNVRF (clears on read; chatty in continuous mode). 0 = omit. */
#define INA228_APP_DIAG_PRINT_CNVRF  0
#endif

/** TI INA228 DIETEMP / TEMP_LIMIT: 7.8125 m°C per LSB (signed 16-bit). */
#define INA228_DIETEMP_LSB_C  (7.8125e-3f)

/** Continuous bus + shunt + temp (mode 0xF); see Adafruit_INA2xx.h INA2XX_MODE_CONTINUOUS */
#define INA228_MODE_CONTINUOUS  0x0Fu

static uint16_t ina228_make_adccfg(void)
{
  return (uint16_t)((INA228_MODE_CONTINUOUS << 12)
                    | (INA228_ADCCFG_CONV << 9)
                    | (INA228_ADCCFG_CONV << 6)
                    | (INA228_ADCCFG_CONV << 3)
                    | (INA228_ADCCFG_AVG & 7u));
}

#define INA228_DEVICE_ID_EXPECT 0x2281u

static uint8_t s_addr7 = INA228_ADDR_7BIT_DEFAULT;
static float s_current_lsb_a = 0.0f;

static uint32_t s_vcom_period_cycles;
static uint32_t s_vcom_last_cyccnt;

static void vcom_timer_arm(void)
{
  CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
  DWT->CYCCNT = 0;
  DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;

  uint32_t hz = INA228_APP_VCOM_RATE_HZ;
  if (hz == 0u) {
    hz = 1u;
  }
  s_vcom_period_cycles = SystemCoreClock / hz;
  if (s_vcom_period_cycles == 0u) {
    s_vcom_period_cycles = 1u;
  }
  s_vcom_last_cyccnt = DWT->CYCCNT;
}

static int vcom_timer_fired(void)
{
  uint32_t now = DWT->CYCCNT;
  return (uint32_t)(now - s_vcom_last_cyccnt) >= s_vcom_period_cycles;
}

static I2C_TypeDef *bus(void)
{
  return sl_i2cspm_sensor;
}

static sl_status_t i2c_transfer(I2C_TransferSeq_TypeDef *seq)
{
  I2C_TransferReturn_TypeDef r = I2CSPM_Transfer(bus(), seq);
  return (r == i2cTransferDone) ? SL_STATUS_OK : SL_STATUS_FAIL;
}

sl_status_t ina228_read_reg16(uint8_t reg, uint16_t *value)
{
  uint8_t tx[1] = { reg };
  uint8_t rx[2];
  I2C_TransferSeq_TypeDef seq;
  seq.addr = (uint16_t)(s_addr7 << 1);
  seq.flags = I2C_FLAG_WRITE_READ;
  seq.buf[0].data = tx;
  seq.buf[0].len = 1;
  seq.buf[1].data = rx;
  seq.buf[1].len = 2;
  sl_status_t sc = i2c_transfer(&seq);
  if (sc != SL_STATUS_OK) {
    return sc;
  }
  *value = ((uint16_t)rx[0] << 8) | rx[1];
  return SL_STATUS_OK;
}

sl_status_t ina228_write_reg16(uint8_t reg, uint16_t value)
{
  uint8_t tx[3] = { reg, (uint8_t)(value >> 8), (uint8_t)value };
  I2C_TransferSeq_TypeDef seq;
  seq.addr = (uint16_t)(s_addr7 << 1);
  seq.flags = I2C_FLAG_WRITE;
  seq.buf[0].data = tx;
  seq.buf[0].len = 3;
  return i2c_transfer(&seq);
}

sl_status_t ina228_read_reg24(uint8_t reg, uint32_t *raw24)
{
  uint8_t tx[1] = { reg };
  uint8_t rx[3];
  I2C_TransferSeq_TypeDef seq;
  seq.addr = (uint16_t)(s_addr7 << 1);
  seq.flags = I2C_FLAG_WRITE_READ;
  seq.buf[0].data = tx;
  seq.buf[0].len = 1;
  seq.buf[1].data = rx;
  seq.buf[1].len = 3;
  sl_status_t sc = i2c_transfer(&seq);
  if (sc != SL_STATUS_OK) {
    return sc;
  }
  *raw24 = ((uint32_t)rx[0] << 16) | ((uint32_t)rx[1] << 8) | rx[2];
  return SL_STATUS_OK;
}

sl_status_t ina228_init(const ina228_config_t *cfg)
{
  if (cfg == NULL || cfg->shunt_resistance_ohm <= 0.0f || cfg->max_expected_current_a <= 0.0f) {
    return SL_STATUS_INVALID_PARAMETER;
  }

  s_addr7 = cfg->i2c_address_7bit;

  uint16_t did;
  sl_status_t s = ina228_read_reg16(INA228_REG_DEVICE_ID, &did);
  if (s != SL_STATUS_OK) {
    return s;
  }
  if (did != INA228_DEVICE_ID_EXPECT) {
    return SL_STATUS_NOT_FOUND;
  }

  s = ina228_write_reg16(INA228_REG_ADCCFG, ina228_make_adccfg());
  if (s != SL_STATUS_OK) {
    return s;
  }

  s_current_lsb_a = cfg->max_expected_current_a / 524288.0f;
  float shunt_cal = 13107.2e6f * s_current_lsb_a * cfg->shunt_resistance_ohm;
  if (INA228_ADCRANGE_LOW != 0) {
    shunt_cal *= 4.0f;
  }
  if (shunt_cal <= 0.0f || !isfinite(shunt_cal) || shunt_cal > 131071.0f) {
    return SL_STATUS_INVALID_PARAMETER;
  }
  uint16_t shunt_cal_u16 = (uint16_t)lrintf(shunt_cal);
  if (shunt_cal_u16 > 0x7FFFu) {
    shunt_cal_u16 = 0x7FFFu;
  }
  s = ina228_write_reg16(INA228_REG_SHUNT_CAL, shunt_cal_u16);
  return s;
}

sl_status_t ina228_read_vbus_v(float *vbus_v)
{
  uint32_t raw;
  sl_status_t s = ina228_read_reg24(INA228_REG_VBUS, &raw);
  if (s != SL_STATUS_OK) {
    return s;
  }
  uint32_t v = (raw >> 4) & 0xFFFFFu;
  *vbus_v = (float)v * 195.3125e-6f;
  return SL_STATUS_OK;
}

sl_status_t ina228_read_current_a(float *current_a)
{
  uint32_t raw;
  sl_status_t s = ina228_read_reg24(INA228_REG_CURRENT, &raw);
  if (s != SL_STATUS_OK) {
    return s;
  }
  int32_t signed20 = (int32_t)((raw & 0xFFFFFF0u) << 8) >> 12;
  *current_a = s_current_lsb_a * (float)signed20;
  return SL_STATUS_OK;
}

sl_status_t ina228_read_die_temp_c(float *temp_c)
{
  uint16_t raw_u16;
  sl_status_t s = ina228_read_reg16(INA228_REG_DIETEMP, &raw_u16);
  if (s != SL_STATUS_OK) {
    return s;
  }
  int16_t counts = (int16_t)raw_u16;
  *temp_c = (float)counts * INA228_DIETEMP_LSB_C;
  return SL_STATUS_OK;
}

sl_status_t ina228_read_diag_alrt(uint16_t *diag)
{
  return ina228_read_reg16(INA228_REG_DIAG_ALRT, diag);
}

sl_status_t ina228_alert_configure(bool conversion_ready_on_alert,
                                   bool latch_alerts,
                                   bool compare_averaged,
                                   bool alert_active_high)
{
  uint16_t v;
  sl_status_t s = ina228_read_reg16(INA228_REG_DIAG_ALRT, &v);
  if (s != SL_STATUS_OK) {
    return s;
  }
  uint16_t cfg = 0;
  if (latch_alerts) {
    cfg |= (uint16_t)(1u << 15);
  }
  if (conversion_ready_on_alert) {
    cfg |= (uint16_t)(1u << 14);
  }
  if (compare_averaged) {
    cfg |= (uint16_t)(1u << 13);
  }
  if (alert_active_high) {
    cfg |= (uint16_t)(1u << 12);
  }
  v = (uint16_t)((v & 0x0FFFu) | (cfg & 0xF000u));
  return ina228_write_reg16(INA228_REG_DIAG_ALRT, v);
}

sl_status_t ina228_alert_set_bus_overvolt_mv(uint32_t threshold_mv)
{
  /* BOVL 14-0: 3.125 mV/LSB => counts = mV * 8 / 25 */
  uint32_t c = (threshold_mv * 8UL) / 25UL;
  if (c > 0x7FFFu) {
    c = 0x7FFFu;
  }
  return ina228_write_reg16(INA228_REG_BOVL, (uint16_t)c);
}

sl_status_t ina228_alert_set_bus_undervolt_mv(uint32_t threshold_mv)
{
  uint32_t c = (threshold_mv * 8UL) / 25UL;
  if (c > 0x7FFFu) {
    c = 0x7FFFu;
  }
  return ina228_write_reg16(INA228_REG_BUVL, (uint16_t)c);
}

static int32_t shunt_uv_to_counts(int32_t shunt_uv)
{
  float lsb_uv = (INA228_ADCRANGE_LOW != 0) ? 1.25f : 5.0f;
  int32_t c = (int32_t)lrintf((float)shunt_uv / lsb_uv);
  if (c > 32767) {
    c = 32767;
  }
  if (c < -32768) {
    c = -32768;
  }
  return c;
}

sl_status_t ina228_alert_set_shunt_overvolt_uv(int32_t shunt_uv)
{
  int32_t c = shunt_uv_to_counts(shunt_uv);
  return ina228_write_reg16(INA228_REG_SOVL, (uint16_t)(int16_t)c);
}

sl_status_t ina228_alert_set_shunt_overvolt_mv(unsigned shunt_mv)
{
  if (shunt_mv > 2147483u) {
    return SL_STATUS_INVALID_PARAMETER;
  }
  return ina228_alert_set_shunt_overvolt_uv((int32_t)shunt_mv * 1000);
}

sl_status_t ina228_alert_set_shunt_overcurrent_ma(unsigned current_ma, float shunt_ohm)
{
  if (current_ma == 0u || shunt_ohm <= 0.0f || !isfinite(shunt_ohm)) {
    return SL_STATUS_INVALID_PARAMETER;
  }
  /* I in mA → µA; Vshunt [µV] = I_µA * R_ohm (since µA×Ω = µV) */
  float ua = (float)current_ma * 1000.0f;
  int32_t uv = (int32_t)lrintf(ua * shunt_ohm);
  if (uv < 1) {
    uv = 1;
  }
  if (uv > 165000) {
    return SL_STATUS_INVALID_PARAMETER;
  }
  return ina228_alert_set_shunt_overvolt_uv(uv);
}

sl_status_t ina228_alert_set_shunt_undervolt_uv(int32_t shunt_uv)
{
  int32_t c = shunt_uv_to_counts(shunt_uv);
  return ina228_write_reg16(INA228_REG_SUVL, (uint16_t)(int16_t)c);
}

sl_status_t ina228_alert_set_die_overtemp_c(float temp_c)
{
  if (!isfinite(temp_c)) {
    return SL_STATUS_INVALID_PARAMETER;
  }
  int32_t c = (int32_t)lrintf(temp_c / INA228_DIETEMP_LSB_C);
  if (c > 32767) {
    c = 32767;
  }
  if (c < -32768) {
    c = -32768;
  }
  return ina228_write_reg16(INA228_REG_TEMP_LIMIT, (uint16_t)(int16_t)c);
}

/** Append human-readable DIAG_ALRT fault tokens (I2C readback; no ALERT pin required). */
static void vcom_print_diag_suffix(sl_status_t sd, uint16_t diag)
{
  if (sd != SL_STATUS_OK) {
    printf(" DIAG=i2c_err");
    return;
  }
  printf(" DIAG=0x%04X", (unsigned)diag);
  if ((diag & INA228_DIAG_BUSOL) != 0u) {
    printf(" BUSOL");
  }
  if ((diag & INA228_DIAG_BUSUL) != 0u) {
    printf(" BUSUL");
  }
  if ((diag & INA228_DIAG_SHNTOL) != 0u) {
    printf(" SHNTOL");
  }
  if ((diag & INA228_DIAG_SHNTUL) != 0u) {
    printf(" SHNTUL");
  }
  if ((diag & INA228_DIAG_TMPOL) != 0u) {
    printf(" TMPOL");
  }
  if ((diag & INA228_DIAG_POL) != 0u) {
    printf(" POL");
  }
#if INA228_APP_DIAG_PRINT_CNVRF
  if ((diag & INA228_DIAG_CNVRF) != 0u) {
    printf(" CNVRF");
  }
#endif
  if ((diag & INA228_DIAG_MATHOF) != 0u) {
    printf(" MATHOF");
  }
  if ((diag & INA228_DIAG_ENERGYOF) != 0u) {
    printf(" ENERGYOF");
  }
  if ((diag & INA228_DIAG_CHARGEOF) != 0u) {
    printf(" CHARGEOF");
  }
  if ((diag & INA228_DIAG_MEMSTAT) == 0u) {
    printf(" MEM_ERR");
  }
}

void ina228_application_start(void)
{
#if !defined(__CROSSWORKS_ARM) && defined(__GNUC__)
  setvbuf(stdout, NULL, _IONBF, 0);
  setvbuf(stdin, NULL, _IONBF, 0);
#endif

  sl_iostream_set_default(sl_iostream_vcom_handle);

  vcom_timer_arm();

  ina228_config_t cfg = {
    .i2c_address_7bit = INA228_ADDR_7BIT_DEFAULT,
    .shunt_resistance_ohm = INA228_APP_SHUNT_OHM,
    .max_expected_current_a = INA228_APP_IMAX_A,
  };

  if (ina228_init(&cfg) != SL_STATUS_OK) {
    printf("INA228 init failed (check I2C wiring, address, shunt value)\r\n");
  } else {
    /* newlib nano printf has no %f unless linked with -u _printf_float */
    unsigned r_mohm = (unsigned)(cfg.shunt_resistance_ohm * 1000.0f + 0.5f);
    unsigned imax_ma = (unsigned)(cfg.max_expected_current_a * 1000.0f + 0.5f);
    printf("INA228 ready (addr 0x%02X, Rshunt=%u mOhm, Imax=%u mA)\r\n",
           (unsigned)cfg.i2c_address_7bit,
           r_mohm,
           imax_ma);
#if INA228_APP_SHUNT_OVER_ALERT_MA > 0
    if (ina228_alert_set_shunt_overcurrent_ma(INA228_APP_SHUNT_OVER_ALERT_MA, cfg.shunt_resistance_ohm)
        != SL_STATUS_OK) {
      printf("INA228 SOVL (>=%u mA) config failed\r\n",
             (unsigned)INA228_APP_SHUNT_OVER_ALERT_MA);
    }
#endif
  }
}

void ina228_application_poll(void)
{
  if (!vcom_timer_fired()) {
    return;
  }

  uint16_t diag = 0;
  sl_status_t sd = ina228_read_diag_alrt(&diag);

  float vbus = 0.0f;
  float amps = 0.0f;
  if (ina228_read_vbus_v(&vbus) == SL_STATUS_OK
      && ina228_read_current_a(&amps) == SL_STATUS_OK) {
    long v_mv = (long)(vbus * 1000.0f + (vbus >= 0.0f ? 0.5f : -0.5f));
    long i_ua = (long)(amps * 1000000.0f + (amps >= 0.0f ? 0.5f : -0.5f));
#if INA228_APP_V_DEADB_MV > 0
    if (v_mv > -(long)INA228_APP_V_DEADB_MV && v_mv < (long)INA228_APP_V_DEADB_MV) {
      v_mv = 0;
    }
#endif
#if INA228_APP_I_DEADB_UA > 0
    if (i_ua > -(long)INA228_APP_I_DEADB_UA && i_ua < (long)INA228_APP_I_DEADB_UA) {
      i_ua = 0;
    }
#endif
    printf("VBUS = %ld mV, I = %ld uA", v_mv, i_ua);
    vcom_print_diag_suffix(sd, diag);
    printf("\r\n");
  } else {
    printf("INA228 read error");
    vcom_print_diag_suffix(sd, diag);
    printf("\r\n");
  }
  s_vcom_last_cyccnt = DWT->CYCCNT;
}
