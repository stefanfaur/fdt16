# FDT-16 Processor

This repository contains the source code for the FDT-16 processor. The processor is implemented in Verilog and includes a variety of modules, an assembler written in Python, and a suite of tests.

## Available Verilog Modules

- ALU
- Flags Register
- Accumulator Register
- Control Unit (To be implemented)
- Data Memory
- Stack Pointer
- Instruction Memory
- Instruction Decoder
- Sign Extend
- CPU (topmodule)
- Multiplexers
- Program Counter
- Registers
- Decoder (to pick working register)

### Running Tests

Before running the tests, make sure you have icarus-verilog installed and set in your PATH as `iverilog`(on Mac you sometimes have to do it manually).
To run all tests, navigate to the `cpu/src/tests` directory and run the `run_all.sh` script:

```bash
cd cpu/src/tests
bash run_all.sh
```

To run an individual test, use the `run_<testname>.sh` script, replacing `<testname>` with the name of the test you want to run:

```bash 
bash run_<testname>.sh
```

### Assembler

The assembler is located in the `cpu/src/Assembler` directory. To run the assembler, use the `assembler.py` script with the input and output file names as arguments:

```bash
python3 assembler.py input_file output_file
```

The assembler can handle comments(`//`).

Here is some sample code: 

```assembly
MOV X, #16
ADD X, #8
MOV X, A
MOV Y, #3
INC X
JMP 34 	// jump somewhere
LSR X
RET 
CMP Y, #3 
BRZ 5
```



### Hardware Schematic

A detailed hardware schematic of the processor can be found [here](https://github.com/stefanfaur/fdt16/blob/main/hw_v3.png). 

