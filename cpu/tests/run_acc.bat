@echo off

cd ..
iverilog -o test_acc.vvp src/acc.v tests/acc_tb.v
vvp test_acc.vvp
