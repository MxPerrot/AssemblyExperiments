# AssemblyExperiments

A collection of simple x86 (32-bit) assembly language programs designed to run on Linux using NASM. This guide provides quick instructions for assembling, linking, debugging, and understanding basic concepts used throughout the repository.

---

## How to Compile and Run Assembly Programs

All examples are written for 32-bit x86 Linux (ELF format) and assume you are using NASM in a WSL2 or Linux environment.

### 1. Assemble the Source File

Use NASM to convert an `.asm` file into an object file:

```bash
nasm -f elf32 filename.asm -o filename.o
```

### 2. Link the Object File

Use the GNU linker to create an executable from the object file:

```bash
ld -m elf_i386 -o output_binary filename.o
```

### 3. Run the Program

```bash
./output_binary
```

---

## How to Debug with GDB

To inspect how the program executes and what registers do, use GDB:

### Start GDB

```bash
gdb ./output_binary
```

### Inside GDB

```bash
(gdb) break _start        # Set breakpoint at entry point
(gdb) run                 # Start execution
(gdb) layout asm          # View assembly instructions (TUI mode)
(gdb) info registers      # View current register values
(gdb) si                  # Step through one instruction at a time
```

Note: If GDB complains about "Function 'main' not defined", just type `n` when prompted — your assembly program begins at `_start`, not `main`.

---

## Basic Concepts

### General Purpose Registers (32-bit)

| Register | Purpose / Convention            |
|----------|----------------------------------|
| `eax`    | Accumulator – syscall number, return values |
| `ebx`    | Base – parameters or general data |
| `ecx`    | Counter – used in loops, shifts    |
| `edx`    | Data – used for I/O, syscall args   |

Each of these is 32 bits wide in 32-bit mode. Their lower parts can also be accessed as 16-bit (`ax`, `bx`, etc.) or 8-bit (`al`, `ah`, etc.).

### Compiler/Assembler Parameters

- `nasm -f elf32`: tells NASM to generate a 32-bit Linux object file in ELF format.
- `ld -m elf_i386`: tells the linker to treat the input as 32-bit (even if you're on a 64-bit machine).

---

## Example Directory Structure

```text
AssemblyExperiments/
├── hello.asm
├── hello.o
├── hello          # compiled binary
├── README.md
```

---

## Notes

- Use `section .data`, `section .bss`, and `section .text` as standard for defining your data and code.
- Indentation and formatting are for readability; they do not affect how NASM assembles the code.
- Use `;` for comments in NASM.
