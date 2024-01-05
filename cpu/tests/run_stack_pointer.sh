#!/bin/bash

cd ..
iverilog -o test_sp.vvp src/stack_pointer.v tests/stack_pointer_tb.v
vvp test_sp.vvp
