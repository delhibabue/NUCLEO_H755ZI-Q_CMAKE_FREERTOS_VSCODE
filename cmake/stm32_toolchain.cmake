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

# CMake toolchain definition for STM32CubeIDE
set (CMAKE_SYSTEM_PROCESSOR "arm" CACHE STRING "")
set (CMAKE_SYSTEM_NAME "Generic" CACHE STRING "")

# Skip link step during toolchain validation.
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# Specify toolchain
set(TOOLCHAIN_PATH "/opt/st/stm32cubeclt_1.16.0/GNU-tools-for-STM32/bin")
set(TOOLCHAIN_PREFIX   "arm-none-eabi-")
set(CMAKE_C_COMPILER   "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}gcc")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}g++")
set(CMAKE_AR           "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}ar")
set(CMAKE_LINKER       "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}ld")
set(CMAKE_OBJCOPY      "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}objcopy")
set(CMAKE_RANLIB       "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}ranlib")
set(CMAKE_SIZE         "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}size")
set(CMAKE_STRIP        "${TOOLCHAIN_PATH}/${TOOLCHAIN_PREFIX}ld")

# Ensure no host libraries are used
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)