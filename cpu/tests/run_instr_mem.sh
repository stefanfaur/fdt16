#!/bin/bash

cd ..
iverilog -o test_instr_mem.vvp src/InstrMem.v tests/instr_mem_tb.v
vvp test_instr_mem.vvp
