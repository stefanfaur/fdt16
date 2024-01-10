from process_file import read_assembly_file

def assemble_instruction(instruction, operand1=None, operand2=None):
    """
    Assemble a single instruction into its 16-bit binary representation.
    """
    opcodes = {
        "LDA": "000101", 
        "STA": "000110",
        "BRZ": "100000", 
        "BRN": "100001", 
        "BRC": "100010", 
        "BRO": "100011",
        "BRA": "100100", 
        "JMP": "100101", 
        "RET": "100110",
        "ADD": "010001", 
        "SUB": "010010", 
        "LSR": "001000",
        "LSL": "001001", 
        "RSR": "001010", 
        "RSL": "001011",
        "MOV": "000111", 
        "MUL": "010111", 
        "DIV": "010100",
        "MOD": "010101", 
        "AND": "001100", 
        "OR":  "001101",
        "XOR": "001110", 
        "NOT": "001111", 
        "CMP": "010110",
        "TST": "010111", 
        "INC": "011000", 
        "DEC": "011001"
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