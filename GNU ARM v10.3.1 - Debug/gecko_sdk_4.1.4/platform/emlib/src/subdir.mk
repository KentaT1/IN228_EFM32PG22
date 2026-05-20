################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_cmu.c \
C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_core.c \
C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_emu.c \
C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_eusart.c \
C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_gpio.c \
C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_i2c.c \
C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_msc.c \
C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_system.c \
C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_usart.c 

OBJS += \
./gecko_sdk_4.1.4/platform/emlib/src/em_cmu.o \
./gecko_sdk_4.1.4/platform/emlib/src/em_core.o \
./gecko_sdk_4.1.4/platform/emlib/src/em_emu.o \
./gecko_sdk_4.1.4/platform/emlib/src/em_eusart.o \
./gecko_sdk_4.1.4/platform/emlib/src/em_gpio.o \
./gecko_sdk_4.1.4/platform/emlib/src/em_i2c.o \
./gecko_sdk_4.1.4/platform/emlib/src/em_msc.o \
./gecko_sdk_4.1.4/platform/emlib/src/em_system.o \
./gecko_sdk_4.1.4/platform/emlib/src/em_usart.o 

C_DEPS += \
./gecko_sdk_4.1.4/platform/emlib/src/em_cmu.d \
./gecko_sdk_4.1.4/platform/emlib/src/em_core.d \
./gecko_sdk_4.1.4/platform/emlib/src/em_emu.d \
./gecko_sdk_4.1.4/platform/emlib/src/em_eusart.d \
./gecko_sdk_4.1.4/platform/emlib/src/em_gpio.d \
./gecko_sdk_4.1.4/platform/emlib/src/em_i2c.d \
./gecko_sdk_4.1.4/platform/emlib/src/em_msc.d \
./gecko_sdk_4.1.4/platform/emlib/src/em_system.d \
./gecko_sdk_4.1.4/platform/emlib/src/em_usart.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.1.4/platform/emlib/src/em_cmu.o: C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_cmu.c gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.1.4/platform/emlib/src/em_cmu.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.1.4/platform/emlib/src/em_core.o: C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_core.c gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.1.4/platform/emlib/src/em_core.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.1.4/platform/emlib/src/em_emu.o: C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_emu.c gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.1.4/platform/emlib/src/em_emu.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.1.4/platform/emlib/src/em_eusart.o: C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_eusart.c gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.1.4/platform/emlib/src/em_eusart.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.1.4/platform/emlib/src/em_gpio.o: C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_gpio.c gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.1.4/platform/emlib/src/em_gpio.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.1.4/platform/emlib/src/em_i2c.o: C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_i2c.c gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.1.4/platform/emlib/src/em_i2c.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.1.4/platform/emlib/src/em_msc.o: C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_msc.c gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.1.4/platform/emlib/src/em_msc.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.1.4/platform/emlib/src/em_system.o: C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_system.c gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.1.4/platform/emlib/src/em_system.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.1.4/platform/emlib/src/em_usart.o: C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk/platform/emlib/src/em_usart.c gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.1.4/platform/emlib/src/em_usart.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


