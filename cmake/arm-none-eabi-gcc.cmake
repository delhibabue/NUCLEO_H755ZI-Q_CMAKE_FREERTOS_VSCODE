# Specify the cross-compiler
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

# Define the toolchain
set(TOOLCHAIN_PATH "/usr")
set(CMAKE_C_COMPILER "${TOOLCHAIN_PATH}/bin/arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PATH}/bin/arm-none-eabi-g++")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_PATH}/bin/arm-none-eabi-gcc")

# Define the tools for binary generation
set(CMAKE_OBJCOPY "${TOOLCHAIN_PATH}/bin/arm-none-eabi-objcopy")
set(CMAKE_SIZE "${TOOLCHAIN_PATH}/bin/arm-none-eabi-size")
set(CMAKE_OBJDUMP arm-none-eabi-objdump)
set(CMAKE_SIZE arm-none-eabi-size)
set(CMAKE_ASM_COMPILER arm-none-eabi-as)

# Set the linker options
set(CMAKE_EXE_LINKER_FLAGS "-nostartfiles -Wl,--gc-sections")