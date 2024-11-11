import re

def parse_llvm_ir(filename):
    llvm_instructions = {}
    with open(filename, 'r') as file:
        for line in file:
            # Match lines with both instructions and dbg info
            instr_match = re.search(r'(.*), !dbg !(\d+)', line)
            if instr_match:
                instruction = instr_match.group(1).strip()
                dbg_id = instr_match.group(2)
                # Find the corresponding line number in metadata (simplified)
                line_info_match = re.search(r'!{} = !DILocation\(line: (\d+),'.format(dbg_id), line)
                if line_info_match:
                    line_number = int(line_info_match.group(1))
                    if line_number not in llvm_instructions:
                        llvm_instructions[line_number] = []
                    llvm_instructions[line_number].append(instruction)
    return llvm_instructions

def parse_assembly(filename):
    asm_instructions = {}
    with open(filename, 'r') as file:
        current_line = None
        for line in file:
            # Match comments indicating source line numbers
            line_match = re.search(r'# Line (\d+)', line)
            if line_match:
                current_line = int(line_match.group(1))
                if current_line not in asm_instructions:
                    asm_instructions[current_line] = []
            elif current_line and line.strip():
                asm_instructions[current_line].append(line.strip())
    return asm_instructions

def map_instructions(llvm_ir, asm_code):
    mapping = {}
    for line_number, llvm_instrs in llvm_ir.items():
        asm_instrs = asm_code.get(line_number, [])
        mapping[line_number] = {"LLVM IR": llvm_instrs, "Assembly": asm_instrs}
    return mapping

# File names for the LLVM IR and assembly files
llvm_ir_file = 'abc.ll'
asm_file = 'abc.s'

# Parse files and create the mapping
llvm_ir_instructions = parse_llvm_ir(llvm_ir_file)
asm_instructions = parse_assembly(asm_file)
instruction_mapping = map_instructions(llvm_ir_instructions, asm_instructions)

# Print the mapping
for line, instructions in instruction_mapping.items():
    print(f"Line {line} in abc.c:")
    print("  LLVM IR Instructions:")
    for instr in instructions["LLVM IR"]:
        print(f"    {instr}")
    print("  Assembly Instructions:")
    for instr in instructions["Assembly"]:
        print(f"    {instr}")
    print()
