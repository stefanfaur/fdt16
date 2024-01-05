@echo off

cd ..
iverilog -o test_instr_mem.vvp src/instr_mem.v tests/instr_mem_tb.v
vvp test_instr_mem.vvp
