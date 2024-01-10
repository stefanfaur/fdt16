from process_instructions import assemble_file

import argparse

def main():
    parser = argparse.ArgumentParser(description="Assemble fdt16 instructions.")

    parser.add_argument('input_file', type=str, help='The name of the file to assemble')
    parser.add_argument('output_file', type=str, help='The name of the file to output the assembled code')

    args = parser.parse_args()

    assembled_code = assemble_file(args.input_file)

    with open(args.output_file, 'w') as f:
        for line in assembled_code:
            f.write(f"{line}\n")

if __name__ == "__main__":
    main()