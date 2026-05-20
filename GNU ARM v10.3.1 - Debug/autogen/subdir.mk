################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../autogen/sl_board_default_init.c \
../autogen/sl_device_init_clocks.c \
../autogen/sl_event_handler.c \
../autogen/sl_i2cspm_init.c \
../autogen/sl_iostream_handles.c \
../autogen/sl_iostream_init_eusart_instances.c 

OBJS += \
./autogen/sl_board_default_init.o \
./autogen/sl_device_init_clocks.o \
./autogen/sl_event_handler.o \
./autogen/sl_i2cspm_init.o \
./autogen/sl_iostream_handles.o \
./autogen/sl_iostream_init_eusart_instances.o 

C_DEPS += \
./autogen/sl_board_default_init.d \
./autogen/sl_device_init_clocks.d \
./autogen/sl_event_handler.d \
./autogen/sl_i2cspm_init.d \
./autogen/sl_iostream_handles.d \
./autogen/sl_iostream_init_eusart_instances.d 


# Each subdirectory must supply rules for building sources it contributes
autogen/sl_board_default_init.o: ../autogen/sl_board_default_init.c autogen/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"autogen/sl_board_default_init.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

autogen/sl_device_init_clocks.o: ../autogen/sl_device_init_clocks.c autogen/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"autogen/sl_device_init_clocks.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

autogen/sl_event_handler.o: ../autogen/sl_event_handler.c autogen/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"autogen/sl_event_handler.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

autogen/sl_i2cspm_init.o: ../autogen/sl_i2cspm_init.c autogen/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"autogen/sl_i2cspm_init.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

autogen/sl_iostream_handles.o: ../autogen/sl_iostream_handles.c autogen/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"autogen/sl_iostream_handles.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

autogen/sl_iostream_init_eusart_instances.o: ../autogen/sl_iostream_init_eusart_instances.c autogen/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DDEBUG=1' '-DSL_BOARD_ENABLE_VCOM=1' '-DDEBUG_EFM=1' '-DEFM32PG22C200F512IM40=1' '-DSL_BOARD_NAME="BRD2503A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/iostream/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/driver/i2cspm/inc" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\config" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen" -I"C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/Device/SiliconLabs/EFM32PG22/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/board/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/CMSIS/Core/Include" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/device_init/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/emlib/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//hardware/driver/mx25_flash_shutdown/inc/sl_mx25_flash_shutdown_usart" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/common/toolchain/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/system/inc" -I"C:/Users/kiran/SimplicityStudio/SDKs/gecko_sdk//platform/service/udelay/inc" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -c -fmessage-length=0 -MMD -MP -MF"autogen/sl_iostream_init_eusart_instances.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


