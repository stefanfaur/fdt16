#!/bin/bash

cd ..
iverilog -o test_dec.vvp src/dec.v tests/dec_tb.v
vvp test_dec.vvp
