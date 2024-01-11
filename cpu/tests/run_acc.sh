#!/bin/bash

cd ..
iverilog -o test_acc.vvp src/Acc.v tests/acc_tb.v
vvp test_acc.vvp
