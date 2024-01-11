#!/bin/bash

cd ..
iverilog -o test_register.vvp src/Register.v tests/register_tb.v
vvp test_register.vvp
