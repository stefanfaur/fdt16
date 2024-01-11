`timescale 1ns / 1ps

module Flags_tb;

    reg clk;
    reg reset;
    reg flags_en;
    reg alu_zero;
    reg alu_negative;
    reg alu_carry;
    reg alu_overflow;

    wire zero_flag;
    wire negative_flag;
    wire carry_flag;
    wire overflow_flag;

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

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 1;
        flags_en = 0;
        alu_zero = 0;
        alu_negative = 0;
        alu_carry = 0;
        alu_overflow = 0;

        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        #10 flags_en = 1;
        #10 alu_zero = 1;
        #10 alu_negative = 1;
        #10 alu_carry = 1;
        #10 alu_overflow = 1;
        #10 flags_en = 0;

        #10 $display("Initial values:");
        #10 $display("zero_flag = %b", zero_flag);
        #10 $display("negative_flag = %b", negative_flag);
        #10 $display("carry_flag = %b", carry_flag);
        #10 $display("overflow_flag = %b", overflow_flag);

        #10 flags_en = 1;
        #10 alu_zero = 0;
        #10 alu_negative = 0;
        #10 alu_carry = 0;
        #10 alu_overflow = 0;
        #10 flags_en = 0;

        #10 $display("Updated values:");
        #10 $display("zero_flag = %b", zero_flag);
        #10 $display("negative_flag = %b", negative_flag);
        #10 $display("carry_flag = %b", carry_flag);
        #10 $display("overflow_flag = %b", overflow_flag);

        #10 $finish;
    end

endmodule