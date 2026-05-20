################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include gecko_sdk_4.1.4/platform/service/udelay/src/subdir.mk
-include gecko_sdk_4.1.4/platform/service/system/src/subdir.mk
-include gecko_sdk_4.1.4/platform/service/iostream/src/subdir.mk
-include gecko_sdk_4.1.4/platform/service/device_init/src/subdir.mk
-include gecko_sdk_4.1.4/platform/emlib/src/subdir.mk
-include gecko_sdk_4.1.4/platform/driver/i2cspm/src/subdir.mk
-include gecko_sdk_4.1.4/platform/common/toolchain/src/subdir.mk
-include gecko_sdk_4.1.4/platform/common/src/subdir.mk
-include gecko_sdk_4.1.4/platform/Device/SiliconLabs/EFM32PG22/Source/subdir.mk
-include gecko_sdk_4.1.4/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_usart/subdir.mk
-include gecko_sdk_4.1.4/hardware/board/src/subdir.mk
-include autogen/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := IN228_EFM32PG22_2
BUILD_ARTIFACT_EXTENSION := axf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: main-build

# Main-build Target
main-build: IN228_EFM32PG22_2.axf

# Tool invocations
IN228_EFM32PG22_2.axf: $(OBJS) $(USER_OBJS) makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -T "C:\Users\kiran\SimplicityStudio\v5_workspace\IN228_EFM32PG22_2\autogen\linkerfile.ld" -Xlinker --gc-sections -Xlinker -Map="IN228_EFM32PG22_2.map" -mfpu=fpv5-sp-d16 -mfloat-abi=hard --specs=nano.specs -o IN228_EFM32PG22_2.axf -Wl,--start-group "./app.o" "./ina228.o" "./main.o" "./autogen/sl_board_default_init.o" "./autogen/sl_device_init_clocks.o" "./autogen/sl_event_handler.o" "./autogen/sl_i2cspm_init.o" "./autogen/sl_iostream_handles.o" "./autogen/sl_iostream_init_eusart_instances.o" "./gecko_sdk_4.1.4/hardware/board/src/sl_board_control_gpio.o" "./gecko_sdk_4.1.4/hardware/board/src/sl_board_init.o" "./gecko_sdk_4.1.4/hardware/driver/mx25_flash_shutdown/src/sl_mx25_flash_shutdown_usart/sl_mx25_flash_shutdown.o" "./gecko_sdk_4.1.4/platform/Device/SiliconLabs/EFM32PG22/Source/startup_efm32pg22.o" "./gecko_sdk_4.1.4/platform/Device/SiliconLabs/EFM32PG22/Source/system_efm32pg22.o" "./gecko_sdk_4.1.4/platform/common/src/sl_assert.o" "./gecko_sdk_4.1.4/platform/common/src/sl_slist.o" "./gecko_sdk_4.1.4/platform/common/toolchain/src/sl_memory.o" "./gecko_sdk_4.1.4/platform/driver/i2cspm/src/sl_i2cspm.o" "./gecko_sdk_4.1.4/platform/emlib/src/em_cmu.o" "./gecko_sdk_4.1.4/platform/emlib/src/em_core.o" "./gecko_sdk_4.1.4/platform/emlib/src/em_emu.o" "./gecko_sdk_4.1.4/platform/emlib/src/em_eusart.o" "./gecko_sdk_4.1.4/platform/emlib/src/em_gpio.o" "./gecko_sdk_4.1.4/platform/emlib/src/em_i2c.o" "./gecko_sdk_4.1.4/platform/emlib/src/em_msc.o" "./gecko_sdk_4.1.4/platform/emlib/src/em_system.o" "./gecko_sdk_4.1.4/platform/emlib/src/em_usart.o" "./gecko_sdk_4.1.4/platform/service/device_init/src/sl_device_init_dcdc_s2.o" "./gecko_sdk_4.1.4/platform/service/device_init/src/sl_device_init_emu_s2.o" "./gecko_sdk_4.1.4/platform/service/device_init/src/sl_device_init_hfxo_s2.o" "./gecko_sdk_4.1.4/platform/service/device_init/src/sl_device_init_lfxo_s2.o" "./gecko_sdk_4.1.4/platform/service/device_init/src/sl_device_init_nvic.o" "./gecko_sdk_4.1.4/platform/service/iostream/src/sl_iostream.o" "./gecko_sdk_4.1.4/platform/service/iostream/src/sl_iostream_eusart.o" "./gecko_sdk_4.1.4/platform/service/iostream/src/sl_iostream_retarget_stdio.o" "./gecko_sdk_4.1.4/platform/service/iostream/src/sl_iostream_stdlib_config.o" "./gecko_sdk_4.1.4/platform/service/iostream/src/sl_iostream_uart.o" "./gecko_sdk_4.1.4/platform/service/system/src/sl_system_init.o" "./gecko_sdk_4.1.4/platform/service/system/src/sl_system_process_action.o" "./gecko_sdk_4.1.4/platform/service/udelay/src/sl_udelay.o" "./gecko_sdk_4.1.4/platform/service/udelay/src/sl_udelay_armv6m_gcc.o" -lgcc -lc -lm -lnosys -Wl,--end-group -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building out file: IN228_EFM32PG22_2.out'
	arm-none-eabi-objcopy "IN228_EFM32PG22_2.axf" "IN228_EFM32PG22_2.out"
	@echo ' '

	@echo 'Building hex file: IN228_EFM32PG22_2.hex'
	arm-none-eabi-objcopy -O ihex "IN228_EFM32PG22_2.axf" "IN228_EFM32PG22_2.hex"
	@echo ' '

	@echo 'Building bin file: IN228_EFM32PG22_2.bin'
	arm-none-eabi-objcopy -O binary "IN228_EFM32PG22_2.axf" "IN228_EFM32PG22_2.bin"
	@echo ' '

	@echo 'Building s37 file: IN228_EFM32PG22_2.s37'
	arm-none-eabi-objcopy -O srec "IN228_EFM32PG22_2.axf" "IN228_EFM32PG22_2.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "IN228_EFM32PG22_2.axf" -A
	@echo ' '

# Other Targets
clean:
	-@$(foreach FILE, $(EXECUTABLES), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(OBJS), $(shell $(RM) $(FILE)) )
	-@$(foreach FILE, $(C_DEPS), $(shell $(RM) $(FILE)) )
	-$(RM) IN228_EFM32PG22_2.axf
	-@echo ' '

.PHONY: all clean dependents main-build

-include ../makefile.targets
