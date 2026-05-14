#ifndef INA228_H
#define INA228_H

#include <stdint.h>
#include <stdbool.h>
#include "sl_status.h"

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @page ina228_alerts Alerts, VBUS (Vout) limits, and DIAG_ALRT
 *
 * Call everything that follows **after** `ina228_init()` succeeds (e.g. from `app_init` or at the
 * end of `ina228_application_start`).
 *
 * **Bus voltage (VBUS / “Vout”) — registers BOVL (0x0E) and BUVL (0x0F)**
 * - `ina228_alert_set_bus_overvolt_mv(mv)` — sets **BOVL**. When measured bus voltage **exceeds**
 *   this threshold (millivolts), **BUSOL** is set in `DIAG_ALRT` and the **ALERT** pin can assert.
 * - `ina228_alert_set_bus_undervolt_mv(mv)` — sets **BUVL**. When bus voltage **falls below** this
 *   value, **BUSUL** is set.
 * - TI LSB for both: **3.125 mV** per count (helpers convert from mV).
 * - After reset, **BOVL ≈ max** and **BUVL ≈ 0** so bus limits often do not trip until you program them.
 *
 * **Shunt voltage (current) — SOVL (0x0C), SUVL (0x0D)**
 * - `ina228_alert_set_shunt_overvolt_mv(mv)` or `ina228_alert_set_shunt_overvolt_uv(µV)` — **SOVL**
 *   trips **SHNTOL** when shunt differential **exceeds** the threshold (positive sense direction).
 * - `ina228_alert_set_shunt_overcurrent_ma(ma, r_ohm)` — convenience: sets **SOVL** from desired
 *   **bus current** (mA) and sense resistor (Ω); uses Vshunt = I×R.
 * - After init, default **`INA228_APP_SHUNT_OVER_ALERT_MA`** programs **SOVL** for **10 mA** unless **0**.
 * - `ina228_alert_set_shunt_undervolt_uv` — **SUVL** for under-limit (µV).
 * - LSB is **5 µV** (default ADC range) or **1.25 µV** if `INA228_ADCRANGE_LOW` matches CONFIG ADCRANGE=1.
 *
 * **Die temperature — TEMP_LIMIT (0x10)**
 * - `ina228_alert_set_die_overtemp_c(deg_c)` uses the same **7.8125 m°C/LSB** scale as the
 *   **DIETEMP** reading. **TMPOL** in `DIAG_ALRT` sets when die temp **exceeds** the limit.
 *
 * **ALERT behavior — DIAG_ALRT (0x0B) top nibble**
 * - `ina228_alert_configure(cnvr, latch, slow_avg, apol)` sets only bits 15:12:
 *   - **CNVR**: also assert ALERT when a conversion completes (optional).
 *   - **ALATCH**: latched faults clear when you **read** `DIAG_ALRT` (and affect the ALERT pin).
 *   - **SLOWALERT**: compare limits to **averaged** ADC data (less noise, slower).
 *   - **APOL**: **active-high** open-drain instead of default **active-low**.
 *
 * **Power limit — PWR_LIMIT (0x11)** — use `ina228_write_reg16(INA228_REG_PWR_LIMIT, raw)` with
 * raw per TI (unsigned, **256 × power LSB**; power LSB relates to current LSB). See INA228 §7.6.1.18.
 *
 * **Reading status**
 * - `ina228_read_diag_alrt()` — I2C read of `DIAG_ALRT`; decode with `INA228_DIAG_*` masks.
 * - `ina228_read_vbus_v()` — measured bus voltage (not a limit).
 *
 * Example (12 V supply, warn if over 13.5 V or under 10.5 V, latched, compare averaged):
 * @code
 *   ina228_alert_set_bus_overvolt_mv(13500);
 *   ina228_alert_set_bus_undervolt_mv(10500);
 *   ina228_alert_configure(false, true, true, false);
 * @endcode
 */

/**
 * ALERT pin (TI INA228): open-drain, default **active-low** (use a pull-up on the line).
 *
 * The part can assert ALERT when any enabled limit is crossed (see limit registers in the
 * datasheet) and/or when a conversion completes if `ina228_alert_configure` enables CNVR.
 * Call `ina228_read_diag_alrt()` to see which condition fired; with latch enabled,
 * reading DIAG_ALRT clears the ALERT pin.
 *
 * MCU: route ALERT to a GPIO (input + optional internal pull-up if your board has no pull-up),
 * use a **falling-edge** interrupt when active-low, and in the ISR (or after wake) call
 * `ina228_read_diag_alrt()` over I2C — keep I2C work minimal in ISR (defer to main loop if needed).
 */

/** DIAG_ALRT (0x0B) masks — combine with value from `ina228_read_diag_alrt()`. */
#define INA228_DIAG_ALATCH    0x8000u /**< Latch mode: ALERT held until DIAG_ALRT read */
#define INA228_DIAG_CNVR_EN   0x4000u /**< When set, conversion complete can assert ALERT */
#define INA228_DIAG_SLOWALERT 0x2000u /**< Compare limits to averaged ADC data */
#define INA228_DIAG_APOL      0x1000u /**< 1 = active-high polarity (still open-drain) */
#define INA228_DIAG_ENERGYOF  0x0800u
#define INA228_DIAG_CHARGEOF  0x0400u
#define INA228_DIAG_MATHOF    0x0200u
#define INA228_DIAG_TMPOL     0x0080u /**< Die temp over TEMP_LIMIT */
#define INA228_DIAG_SHNTOL    0x0040u /**< Shunt over SOVL */
#define INA228_DIAG_SHNTUL    0x0020u /**< Shunt under SUVL */
#define INA228_DIAG_BUSOL     0x0010u /**< Bus over BOVL */
#define INA228_DIAG_BUSUL     0x0008u /**< Bus under BUVL */
#define INA228_DIAG_POL       0x0004u /**< Power over PWR_LIMIT */
#define INA228_DIAG_CNVRF     0x0002u /**< Conversion complete (status) */
#define INA228_DIAG_MEMSTAT  0x0001u /**< 1 = trim memory OK */

/** Default 7-bit I2C address with A1=A0=GND on many TI boards */
#define INA228_ADDR_7BIT_DEFAULT    0x40

/** I2C register addresses (TI INA228 datasheet §7.6). */
#define INA228_REG_ADCCFG       0x01u
#define INA228_REG_SHUNT_CAL    0x02u
#define INA228_REG_VBUS         0x05u
#define INA228_REG_DIETEMP      0x06u
#define INA228_REG_CURRENT      0x07u
#define INA228_REG_DIAG_ALRT    0x0Bu
#define INA228_REG_SOVL         0x0Cu
#define INA228_REG_SUVL         0x0Du
#define INA228_REG_BOVL         0x0Eu
#define INA228_REG_BUVL         0x0Fu
#define INA228_REG_TEMP_LIMIT   0x10u
#define INA228_REG_PWR_LIMIT    0x11u
#define INA228_REG_DEVICE_ID    0x3Fu

typedef struct {
  uint8_t i2c_address_7bit; /**< 7-bit address, e.g. 0x40 */
  float shunt_resistance_ohm; /**< Sense resistor value (e.g. 0.01 for 10 mOhm) */
  float max_expected_current_a; /**< Used to set CURRENT_LSB and SHUNT_CAL */
} ina228_config_t;

sl_status_t ina228_init(const ina228_config_t *cfg);

/** Bus voltage in volts (VBUS register) */
sl_status_t ina228_read_vbus_v(float *vbus_v);

/** Load current in amperes (CURRENT register; requires SHUNT_CAL programmed) */
sl_status_t ina228_read_current_a(float *current_a);

/** INA228 internal junction temperature in degrees Celsius (DIETEMP register). */
sl_status_t ina228_read_die_temp_c(float *temp_c);

/** Raw 16-bit read (MSB first) from a 16-bit register */
sl_status_t ina228_read_reg16(uint8_t reg, uint16_t *value);

/** Raw 16-bit write (MSB first). Use with `INA228_REG_*` for limits not wrapped by helpers. */
sl_status_t ina228_write_reg16(uint8_t reg, uint16_t value);

/** Raw 24-bit measurement register (VBUS, CURRENT, etc.); MSB first on wire */
sl_status_t ina228_read_reg24(uint8_t reg, uint32_t *raw24);

/** Read DIAG_ALRT (0x0B); use `INA228_DIAG_*` masks. Clears latched ALERT if ALATCH was set. */
sl_status_t ina228_read_diag_alrt(uint16_t *diag);

/**
 * Write DIAG_ALRT bits 15:12 only (ALATCH, CNVR, SLOWALERT, APOL). Lower bits are preserved
 * from the last read so sticky status is not cleared unintentionally.
 */
sl_status_t ina228_alert_configure(bool conversion_ready_on_alert,
                                  bool latch_alerts,
                                  bool compare_averaged,
                                  bool alert_active_high);

/** Bus over-voltage threshold (BOVL @ 0x0E); ALERT when VBUS exceeds `threshold_mv`. LSB = 3.125 mV. */
sl_status_t ina228_alert_set_bus_overvolt_mv(uint32_t threshold_mv);

/** Bus under-voltage threshold (BUVL @ 0x0F); ALERT when VBUS falls below `threshold_mv`. LSB = 3.125 mV. */
sl_status_t ina228_alert_set_bus_undervolt_mv(uint32_t threshold_mv);

/**
 * Shunt over-voltage limit (SOVL): threshold in **microvolts** across the shunt (IN+ − IN−).
 * LSB = 5 µV (default ±163.84 mV range) or 1.25 µV if `INA228_ADCRANGE_LOW` matches CONFIG ADCRANGE=1.
 */
sl_status_t ina228_alert_set_shunt_overvolt_uv(int32_t shunt_uv);

/**
 * Shunt over-voltage limit (SOVL): `shunt_mv` is millivolts across the shunt (IN+ − IN−).
 * Same LSB rules as `ina228_alert_set_shunt_overvolt_uv`.
 */
sl_status_t ina228_alert_set_shunt_overvolt_mv(unsigned shunt_mv);

/**
 * Shunt over-voltage limit (SOVL) from **load current**: `current_ma` (mA) through `shunt_ohm` (Ω).
 * Uses Vshunt = I×R, then programs SOVL (same path as `ina228_alert_set_shunt_overvolt_uv`).
 */
sl_status_t ina228_alert_set_shunt_overcurrent_ma(unsigned current_ma, float shunt_ohm);

/** Shunt under-voltage limit (SUVL); same units as `ina228_alert_set_shunt_overvolt_uv`. */
sl_status_t ina228_alert_set_shunt_undervolt_uv(int32_t shunt_uv);

/** Die over-temperature limit (TEMP_LIMIT); same °C scale as `ina228_read_die_temp_c`. */
sl_status_t ina228_alert_set_die_overtemp_c(float temp_c);

/** VCOM + stdio + sensor calibration; call from app_init (once). */
void ina228_application_start(void);

/** Read VBUS/current, poll DIAG_ALRT over I2C, print on VCOM; call from app_process_action. */
void ina228_application_poll(void);

#ifdef __cplusplus
}
#endif

#endif
