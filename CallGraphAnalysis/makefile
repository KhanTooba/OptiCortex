# Makefile for building the Call Graph Pass

# Compiler
CXX = clang++-10

# Source file
SRC = CallGraphPass.cpp

# Output shared library
OUT = libCallGraphPass.so

# LLVM flags
CXXFLAGS = `llvm-config --cxxflags`
LDFLAGS = `llvm-config --ldflags`

# Default target
all: $(OUT)

# Rule to create the shared library
$(OUT): $(SRC)
	$(CXX) $(CXXFLAGS) -shared -fPIC -o $@ $< $(LDFLAGS)

# Clean target to remove generated files
clean:
	rm -f $(OUT)

.PHONY: all clean
