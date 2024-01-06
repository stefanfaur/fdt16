@echo off

cd ..
iverilog -o test_instr_decoder.vvp src/instr_decoder.v tests/instr_decoder_tb.v
vvp test_instr_decoder.vvp
