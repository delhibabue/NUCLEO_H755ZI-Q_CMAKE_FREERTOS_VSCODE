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