#!/bin/bash

cd ..
iverilog -o test_datamem.vvp src/DataMemory.v tests/data_memory_tb.v
vvp test_datamem.vvp
