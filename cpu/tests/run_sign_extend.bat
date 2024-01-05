@echo off

cd ..
iverilog -o test_sign_extend.vvp src/sign_extend.v tests/sign_extend_tb.v
vvp test_sign_extend.vvp
