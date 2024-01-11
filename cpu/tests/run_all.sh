#!/bin/bash


run_test() {
    echo "$1: $2"
    ./$1
    echo "------------------------------------------------------------------------"
}


run_test "run_acc.sh" "Accumulator test"
run_test "run_dec.sh" "Decoder test"
run_test "run_pc.sh" "Program counter test"
run_test "run_mux.sh" "Multiplexer test"
run_test "run_flags.sh" "Flags test"
run_test "run_register.sh" "Register test"
run_test "run_instr_mem.sh" "Instruction memory test"
run_test "run_stack_pointer.sh" "Stack pointer test"
run_test "run_data_memory.sh" "Data memory test"
run_test "run_alu.sh" "ALU test"


# doing some cleanup
cd ..
rm *.vvp 
