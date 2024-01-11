#!/bin/bash

cd ..
iverilog -o test_pc.vvp src/PC.v tests/pc_tb.v
vvp test_pc.vvp
