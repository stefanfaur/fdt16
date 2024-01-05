`timescale 1ns / 1ps

module Flags_tb;

    // Declare wires for the inputs
    reg clk;
    reg reset;
    reg flags_en;
    reg alu_zero;
    reg alu_negative;
    reg alu_carry;
    reg alu_overflow;

    // Declare wires for the outputs
    wire zero_flag;
    wire negative_flag;
    wire carry_flag;
    wire overflow_flag;

    // Instantiate the Flags register
    Flags uut (
        .clk(clk),
        .reset(reset),
        .flags_en(flags_en),
        .alu_zero(alu_zero),
        .alu_negative(alu_negative),
        .alu_carry(alu_carry),
        .alu_overflow(alu_overflow),
        .zero_flag(zero_flag),
        .negative_flag(negative_flag),
        .carry_flag(carry_flag),
        .overflow_flag(overflow_flag)
    );

    // Generate a clock signal
    always begin
        #5 clk = ~clk;
    end

    // Test procedure
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        flags_en = 0;
        alu_zero = 0;
        alu_negative = 0;
        alu_carry = 0;
        alu_overflow = 0;

        // Apply reset
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Apply some inputs and enable flags
        #10 flags_en = 1;
        #10 alu_zero = 1;
        #10 alu_negative = 1;
        #10 alu_carry = 1;
        #10 alu_overflow = 1;
        #10 flags_en = 0;

        // Print the initial values
        #10 $display("Initial values:");
        #10 $display("zero_flag = %b", zero_flag);
        #10 $display("negative_flag = %b", negative_flag);
        #10 $display("carry_flag = %b", carry_flag);
        #10 $display("overflow_flag = %b", overflow_flag);

        // Apply new inputs
        #10 flags_en = 1;
        #10 alu_zero = 0;
        #10 alu_negative = 0;
        #10 alu_carry = 0;
        #10 alu_overflow = 0;
        #10 flags_en = 0;

        // Print the updated values
        #10 $display("Updated values:");
        #10 $display("zero_flag = %b", zero_flag);
        #10 $display("negative_flag = %b", negative_flag);
        #10 $display("carry_flag = %b", carry_flag);
        #10 $display("overflow_flag = %b", overflow_flag);

        // End the simulation
        #10 $finish;
    end

endmodule