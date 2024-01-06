@echo off

cd ..
iverilog -o test_mux.vvp src/mux.v tests/mux_tb.v
vvp test_mux.vvp
