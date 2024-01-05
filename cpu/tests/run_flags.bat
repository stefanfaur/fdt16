@echo off

cd ..
iverilog -o test_flags.vvp src/flags.v tests/flags_tb.v
vvp test_flags.vvp
