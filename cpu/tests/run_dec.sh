#!/bin/bash

cd ..
iverilog -o test_dec.vvp src/Decoder1to2.v tests/dec_tb.v
vvp test_dec.vvp
