# RISC-V assembly no libc example

This repository contains an example of a simple RISC-V program written in assembly without using the C standard library (libc). The program demonstrates basic user interaction through system calls.

## Files

The project consists of three main files:
- `main.s` - RISC-V assembly source code
- `rv64.ld` - linker script
- `Makefile` - build automation file
- `06.RISC-V-assembly-intro.pdf` - slides from lecture

### Implementation Details

- The program uses only basic system calls:
  - `write` (64) - for text output
  - `read` (63) - for user input
  - `exit` (93) - for program termination
- No external libraries are used
- Demonstrates working with data and text sections
- Uses a linker script for precise control over section placement in memory

## Building

To build the project, run:
```bash
make
```

This will create the executable file `hello`.

To clean build files:
```bash
make clean
```

## Linker Script Structure

`rv64.ld` defines the following segments:
- text: code segment (Read + Execute)
- rodata: constants segment (Read-only)
- data: data segment (Read + Write)

The script also sets the `_start` entry point and the base load address at `0x80000000`.

