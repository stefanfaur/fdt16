#!/bin/bash

cd ..
iverilog -o test_sp.vvp src/StackPointer.v tests/stack_pointer_tb.v
vvp test_sp.vvp
