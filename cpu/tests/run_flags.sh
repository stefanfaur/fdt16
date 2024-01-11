#!/bin/bash

cd ..
iverilog -o test_flags.vvp src/Flags.v tests/flags_tb.v
vvp test_flags.vvp
