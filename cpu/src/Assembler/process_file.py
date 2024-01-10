def parse_line(line):
    """
    Parse a line of assembly code and extract the instruction and operands.
    Ignores comments and empty lines.
    """
    line = line.split('//')[0].strip() # ignore comments

    parts = line.split()

    if not parts:
        return None

    # Extract instruction and operands
    instruction = parts[0]
    operands = parts[1:] if len(parts) > 1 else []

    # Remove comma from the first operand if it exists
    if operands and ',' in operands[0]:
        operands[0] = operands[0].replace(',', '')

    return instruction, operands

def read_assembly_file(file_path):
    """
    Read an assembly file and return a list of parsed instructions.
    """
    with open(file_path, 'r') as file:
        lines = file.readlines()

    parsed_instructions = []
    for line in lines:
        parsed_instruction = parse_line(line)
        if parsed_instruction:
            parsed_instructions.append(parsed_instruction)
    return parsed_instructions