#!/bin/bash

cd ..
iverilog -o test_register.vvp src/register.v tests/register_tb.v
vvp test_register.vvp
