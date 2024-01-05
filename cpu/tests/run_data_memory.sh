#!/bin/bash

cd ..
iverilog -o test_datamem.vvp src/data_memory.v tests/data_memory_tb.v
vvp test_datamem.vvp
