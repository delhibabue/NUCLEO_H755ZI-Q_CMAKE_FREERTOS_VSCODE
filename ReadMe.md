# NUCLEO-H755ZI-Q Board with CMake and VSCode

## Overview
This project demonstrates how to utilize `FreeRTOS` for asymmetric multi-processing (AMP) on the `STM32H755ZI-Q` microcontroller, featuring dual cores (Cortex-M7 and Cortex-M4). The application showcases message-based communication between the cores using `FreeRTOS` message buffers, and is designed to be built and flashed using modern development tools like `CMake`, `VSCode`, and `Docker` for a streamlined development experience.

### Key Concepts:
`FreeRTOS AMP (Asymmetric Multi-Processing):` Dual-core architecture where each core (Cortex-M7 and Cortex-M4) runs its own FreeRTOS instance. Core 1 (Cortex-M7) sends messages to Core 2 (Cortex-M4) using message buffers.

`Dual-Core System:` The Cortex-M7 handles the main logic and Cortex-M4 receives messages and performs additional tasks. Both cores communicate using shared memory and message buffers.

### Application Flow:
#### Cortex-M7 (Core 1)
Runs the prvCore1Task which sends messages to Cortex-M4 via message buffers.
The system status is monitored, with LED1 blinking every 2 seconds to show normal operation or LED2 turning on if an error occurs.

#### Cortex-M4 (Core 2)
Runs two instances of prvCore2Task for handling messages from Cortex-M7 through separate message buffers.
An interrupt service routine (ISR) triggered by Cortex-M7 executes on Cortex-M4, facilitating additional communication using a third message buffer.

#### System Configuration:

The system clock is optimized for dual-core operation, with Cortex-M7 running at 400 MHz and Cortex-M4 at 200 MHz.
The peripheral clocks for D1, D2, and D3 domains are set to 200 MHz, with APB clock dividers running at 100 MHz.

## Development Setup:
This project utilizes a modern development environment to build, flash, and debug the application. The setup is optimized for Docker, CMake, and VSCode to provide a consistent and easy-to-use development process.

### Development Tools & Workflow:
#### Docker:
A Docker container is provided to set up a clean, consistent environment for building the firmware with CMake and Ninja. This eliminates dependency issues and simplifies the setup process.
You can build the project on any host machine without worrying about local toolchain configurations by simply using the Docker container.

#### CMake:
CMake is used for project configuration and generating the build system. It automatically handles the generation of build files for the target environment (e.g., Ninja or Make).
The project is designed to be cross-platform and can be built both in Docker and on the host system if the appropriate toolchains are installed.
VSCode:

#### Visual Studio Code (VSCode)
My recommended Integrated Development Environment (IDE) for editing and debugging the project. VSCode supports CMake integration, remote debugging, and can be used with Docker to seamlessly interact with the development environment.
`STM32CubeIDE or VSCode + STM32 STLink` can also be used to flash the firmware to the STM32H755ZI-Q board and perform debugging tasks.

## Dependencies
1. `Ubuntu 22.04 LTS`
2. `Visual Studio Code` with extensions in `<ProjectDir>/.vscode/extensions.json`
3. `ST-Link`: Used for flashing the microcontroller.
4. `STM32CubeCLT`: includes GNU C/C++ for Arm® toolchain executables, GDB debugger, and STM32CubeProgrammer (STM32CubeProg) utility. download and install from https://www.st.com/en/development-tools/stm32cubeclt.html

## Folder Structure
The project is organized as follows:

```
Copy code
├── CMakeLists.txt       # Root CMake configuration file
├── cmake                # CMake toolchain files
│   ├── arm-none-eabi-gcc.cmake  # ARM toolchain configuration
│   └── stm32_toolchain.cmake    # STM32-specific toolchain 
├── CM4                  # Cortex-M4 core project files
│   ├── CMakeLists.txt   # CMake build script for Core M4
│   ├── Inc              # Header files for Core M4
│   ├── Src              # Source files for Core M4
│   └── STM32H755ZITX_FLASH.ld  # Linker script for Core M4
├── CM7                  # Cortex-M7 core project files
│   ├── CMakeLists.txt   # CMake build script for Core M7
│   ├── Inc              # Header files for Core M7
│   ├── Src              # Source files for Core M7
│   └── STM32H755ZITX_FLASH.ld  # Linker script for Core M7
configuration
├── Common               # Common code for both cores
│   ├── Inc              # Common header files
│   ├── Src              # Common source files
├── Drivers              # STM32 HAL, BSP, CMSIS, and driver files
│   ├── BSP
│   ├── CMSIS
│   ├── STM32H7xx_HAL_Driver
├── Middlewares          # FreeRTOS middleware
│   └── Third_Party
│       └── FreeRTOS
├── STM32H755_CM4.svd    # SVD file for Cortex-M4 debugging
├── STM32H755_CM7.svd    # SVD file for Cortex-M7 debugging
└── Utilities            # Utility files and scripts
```

### Clone the Repository
Clone the repository to your local machine:

```
git clone https://github.com/your-username/NUCLEO-H755ZI-Q-Dual-Core-Project.git
cd NUCLEO-H755ZI-Q-Dual-Core-Project
```
### Build Docker Image
Use the provided Dockerfile to create a container with the necessary toolchain and dependencies.

Build the Docker image using the launch_docker.sh script:

```
./launch_docker.sh
```

This script builds the Docker image and starts a container, ensuring the correct permissions and volume mappings between your host system and the Docker container.

### Configure Project
Once inside the Docker container, you can configure the project using CMake:

```
cmake -S . -B build -G Ninja
```

This will create a build directory and generate the necessary build files using Ninja.

### Build Project
To compile the project for both Cortex-M4 and Cortex-M7, run the following command:

```
cmake --build build
```

This will generate the following ELF files:

```
<ProjectDir>/build/CM4/STM32H755_FreeRTOS_CM4.elf
<ProjectDir>/build/CM7/STM32H755_FreeRTOS_CM7.elf
```

### Flashing
After building the firmware, you can flash the generated .elf files to the STM32 microcontroller using VS Code and the ST-Link utility.

***Note: Connect the **NUCLEO-H755ZI-Q** board* :)
***You could ```dmesg command``` to find out if NUCLEO Board is connected* :)

```
st-flash write build/CM4/STM32H755_FreeRTOS_CM4.elf 0x08000000
st-flash write build/CM7/STM32H755_FreeRTOS_CM7.elf 0x08100000
```

These commands flash the respective ELF files to the STM32's flash

### Debugging
Open the Debug panel (Ctrl+Shift+D).
Select the desired debug configuration (either Cortex-M7 or Cortex-M4).

Click the green Start Debugging button or use the shortcut (F5).
You should now be able to step through your code and monitor variables in the Debug Console.

## Project Explanation
### Cortex-M7 (Core 0)
The Cortex-M7 core is responsible for running FreeRTOS and blinking an LED as a demonstration. You can add additional functionality here to implement more complex tasks.

### Cortex-M4 (Core 1)
The Cortex-M4 core is currently idle but available for future development. This core can be configured to perform tasks in parallel with the Cortex-M7.

### Common Code
The common folder contains shared files, such as initialization routines and configuration headers, which are used by both cores.

### Drivers and Middleware
The drivers folder includes the STM32 HAL drivers and BSP files, while the middleware folder contains FreeRTOS for task management across both cores.

## License
Source code follows source code based licenses, CMakefiles, Dockerfile and VSCode infrastructure settings follows MIT License - see the [LICENSE](LICENSE) file for details.