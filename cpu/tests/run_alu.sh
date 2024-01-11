#!/bin/bash

cd ..
iverilog -o test_alu.vvp src/ALU.v tests/alu_tb.v
vvp test_alu.vvp
