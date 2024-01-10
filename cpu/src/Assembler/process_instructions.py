from process_file import read_assembly_file

def assemble_instruction(instruction, operand1=None, operand2=None):
    """
    Assemble a single instruction into its 16-bit binary representation.
    """
    opcodes = {
        "LDA": "000000", 
        "STA": "000001",
        "BRZ": "000010", 
        "BRN": "000011", 
        "BRC": "000100", 
        "BRO": "000101",
        "BRA": "000110", 
        "JMP": "000111", 
        "RET": "001000",
        "ADD": "001001", 
        "SUB": "001010", 
        "LSR": "001011",
        "LSL": "001100", 
        "RSR": "001101", 
        "RSL": "001110",
        "MOV": "001111", 
        "MUL": "010000", 
        "DIV": "010001",
        "MOD": "010010", 
        "AND": "010011", 
        "OR":  "010100",
        "XOR": "010101", 
        "NOT": "010110", 
        "CMP": "010111",
        "TST": "011000", 
        "INC": "011001", 
        "DEC": "011010"
    }

    # Register encoding
    registers = {"X": "0", "Y": "1"}

    # Start assembling the instruction
    opcode = opcodes.get(instruction, "??????")
    reg = ""
    immediate = ""

    # Handle different operand types
    if operand1 in registers:
        reg = registers[operand1]
        # print ("opr " + operand1)
    if operand2 and operand2.startswith('#'):
            immediate = format(int(operand2[1:]), '09b')  # Immediate value
    elif operand2 == "A":
        immediate = format(511, '09b')
    elif operand2 == "X":
        immediate = format(510, '09b')
    elif operand2 == "Y":
        immediate = format(509, '09b')
    elif operand1 and operand1.isdigit():
        immediate = format(int(operand1), '09b')  # Address

    # Construct the 16-bit instruction
    binary_instruction = opcode + reg + immediate
    return binary_instruction.ljust(16, '0')  # Pad with zeros if needed

def assemble_file(file_path):
    """
    Assemble the contents of an assembly file into binary code.
    """
    parsed_instructions = read_assembly_file(file_path)
    assembled_code = []
    
    print(parsed_instructions)

    for instruction, operands in parsed_instructions:
        # Handle different operand formats
        if len(operands) == 1:
            operand1, operand2 = operands[0], None
        elif len(operands) == 2:
            operand1, operand2 = operands
        else:
            operand1 = operand2 = None

        print (instruction, operand1, operand2)
        
        # Assemble the instruction
        binary_instruction = assemble_instruction(instruction, operand1, operand2)
        assembled_code.append(binary_instruction)

    return assembled_code