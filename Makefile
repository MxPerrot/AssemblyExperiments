# Directories
SRC_DIR := projects
BIN_DIR := bin
BUILD_DIR := build

# Find all .asm files in projects/ and strip extensions
ASM_FILES := $(wildcard $(SRC_DIR)/*.asm)
PROGRAMS := $(patsubst $(SRC_DIR)/%.asm, $(BIN_DIR)/%, $(ASM_FILES))

# Default target
all: $(PROGRAMS)

# Build each executable from .asm
$(BIN_DIR)/%: $(SRC_DIR)/%.asm | $(BIN_DIR) $(BUILD_DIR)
	nasm -f elf32 $< -o $(BUILD_DIR)/$*.o
	ld -m elf_i386 -o $@ $(BUILD_DIR)/$*.o

# Ensure bin/ and build/ exist
$(BIN_DIR):
	mkdir -p $@

$(BUILD_DIR):
	mkdir -p $@

# Clean up
clean:
	rm -rf $(BIN_DIR)/* $(BUILD_DIR)/*
