# MIT License
# 
# Copyright (c) 2024 Delhi Babu Eswaran
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

cmake_minimum_required(VERSION 3.15)

# Project name and settings
project(STM32H755_FreeRTOS_CM7 LANGUAGES C CXX ASM)

# Specify the target MCU
set(TARGET_MCU STM32H755ZITx)

# Set the target board
set(TARGET_BOARD NUCLEO-H755ZI-Q)

# Add the linker script
set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/CM7/STM32H755ZITX_FLASH.ld")

# Add source files from CM7 and Common
set(PROJECT_SOURCES
    ${CMAKE_SOURCE_DIR}/Common/Src/system_stm32h7xx.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_adc.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_adc_ex.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_cortex.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_dma.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_dma_ex.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_exti.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_gpio.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_hsem.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_i2c.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_i2c_ex.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_pwr.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_pwr_ex.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rcc.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_rcc_ex.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_tim.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_tim_ex.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_uart.c
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Src/stm32h7xx_hal_uart_ex.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/croutine.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/event_groups.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/list.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/queue.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/stream_buffer.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/tasks.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/timers.c
    ${CMAKE_SOURCE_DIR}/CM7/Src/main.c
    ${CMAKE_SOURCE_DIR}/CM7/Src/stm32h7xx_it.c
    ${CMAKE_SOURCE_DIR}/CM7/Src/syscalls.c
    ${CMAKE_SOURCE_DIR}/CM7/Src/sysmem.c
    ${CMAKE_SOURCE_DIR}/Drivers/BSP/STM32H7xx_Nucleo/stm32h7xx_nucleo.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/cmsis_os.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c
)

# Include directories from CM4 and Common
include_directories(
    ${CMAKE_SOURCE_DIR}/CM4    
    ${CMAKE_SOURCE_DIR}/CM4/Inc

    ${CMAKE_SOURCE_DIR}/Drivers
    ${CMAKE_SOURCE_DIR}/Drivers/BSP
    ${CMAKE_SOURCE_DIR}/Drivers/BSP/Components
    ${CMAKE_SOURCE_DIR}/Drivers/BSP/Components/Common
    ${CMAKE_SOURCE_DIR}/Drivers/BSP/STM32H7xx_Nucleo

    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver
    ${CMAKE_SOURCE_DIR}/Drivers/STM32H7xx_HAL_Driver/Inc

    ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Device
    ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Device/ST
    ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32H7xx
    ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Device/ST/STM32H7xx/Include
    ${CMAKE_SOURCE_DIR}/Drivers/CMSIS/Include

    ${CMAKE_SOURCE_DIR}/Middlewares
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/include
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/portable
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F
    ${CMAKE_SOURCE_DIR}/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS

    ${CMAKE_SOURCE_DIR}/Utilities
    ${CMAKE_SOURCE_DIR}/Utilities/CPU
    ${CMAKE_SOURCE_DIR}/Utilities/Fonts
    
    ${CMAKE_SOURCE_DIR}/Common
    ${CMAKE_SOURCE_DIR}/Common/Inc
)

# Add the linker script
set(LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/CM7/STM32H755ZITX_FLASH.ld")

# Specify assembler sources if any
file(GLOB_RECURSE ASM_SOURCES
    ${CMAKE_SOURCE_DIR}/CM7/Src/*.s
)

set (CMAKE_EXECUTABLE_SUFFIX ".elf")
set (CMAKE_STATIC_LIBRARY_SUFFIX ".a")

# Set C compiler flags (for .c files)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-d16 -DCORE_CM7=1 -DSTM32H755xx=1 -DUSE_HAL_DRIVER=1 -DUSE_IOEXPANDER=1 -DUSE_STM32H7XX_NUCLEO_144_MB1363=1 -DSTM32H755ZITx=1 -g3 -Wno-unused-variable -DDEBUG=1")

# Set C++ compiler flags (for .cpp files)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv5-d16 -DCORE_CM7=1 -DSTM32H755xx=1 -DUSE_HAL_DRIVER=1 -DUSE_IOEXPANDER=1 -DUSE_STM32H7XX_NUCLEO_144_MB1363=1 -DSTM32H755ZITx=1 -g3 -Wno-unused-variable -DDEBUG=1")

# Set assembler flags (for .s files)
set(CMAKE_ASM_FLAGS "-mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv5-d16")

# Add executable target
add_executable(${PROJECT_NAME} ${PROJECT_SOURCES} ${ASM_SOURCES})

# Linker options
target_link_options(${PROJECT_NAME} PRIVATE
    -T${LINKER_SCRIPT}
    -mcpu=cortex-m4
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
    -mthumb
    -Wl,-Map=${PROJECT_NAME}.map
    -Wl,--gc-sections
    -static
    -Wl,--start-group
    -lc
    -lm
    -Wl,--end-group
)

# Post-build steps (e.g., generate binary and hex files)
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${PROJECT_NAME}> ${PROJECT_NAME}.bin
    COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${PROJECT_NAME}> ${PROJECT_NAME}.hex
    COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${PROJECT_NAME}>
)