/***************************************************************************//**
 * @file app.c
 * @brief Application entry; delegates to INA228 module.
 ******************************************************************************/
#include "app.h"
#include "ina228.h"

void app_init(void)
{
  ina228_application_start();
}

void app_process_action(void)
{
  ina228_application_poll();
}
