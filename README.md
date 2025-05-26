# AssemblyExperiments

This is a collection of mini NASM Linux 32-bit assembly projects I wrote to teach myself this language

# Structure

- `projects/` contains individual `.asm` files for each mini program
- `bin/` compiled executables (git ignored)
- `build/` intermediate object files (git ignored)
- `Makefile` the build file
- `cheatsheet.md` A cheatsheet / notes about asm
- `README.md` This file

# Requirements

- NASM assembler
- GNU linker (ld)
- Linux or WSL2 environment

# Building

Use `make` from the root directory

```bash
make		# Build all projects
make clean	# Remove executables and object files
```

Executables are placed in the `bin/` directory.

# GitHub Actions

A CI workflow is included to build all projects on push and pull requests using GitHub-hosted Ubuntu runners.

# License

MIT License

# Projects

## [Hello World](projects/hello_world.asm)

A simple hello world program

It prints "Hello, World!"

## [Print](projects/print.asm)

A print program that prints two messages

## [User Input](projects/user_input.asm)

This one prompts the user for an input, and prints said input.

## [Check Age](projects/check_age.asm)

This program prompts the user for its age,
and checks if it's over or under 18 and prints a message accordingly.

## [Print Function](projects/print_function.asm)

This program does almost the same as print.asm, but uses a subroutine for it
