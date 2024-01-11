`timescale 1ns / 1ps

module ALU_tb;

reg signed [15:0] term1, term2;
reg [5:0] opcode;
reg store;

wire signed [15:0] alu_out;
wire zero, negative, overflow, carry;

ALU uut (
    .store(store),
    .term1(term1),
    .term2(term2),
    .opcode(opcode),
    .alu_out(alu_out),
    .zero(zero),
    .negative(negative),
    .overflow(overflow),
    .carry(carry)
);

initial begin
    store = 0;
    term1 = 16'b0000111100001111;
    term2 = 16'b1111000011110000;

    opcode = 6'b010001; // ADD
    #10 $display("ADD: term1 = %b, term2 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b, carry = %b", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("ADD: term1 = %d, term2 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d, carry = %d", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("");

    opcode = 6'b010010; // SUB
    #10 $display("SUB: term1 = %b, term2 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b, carry = %b", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("SUB: term1 = %d, term2 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d, carry = %d", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("");

    term1 = 16'b1010101;
    term2 = 16'b00000011;

    opcode = 6'b001000; // LSR
    #10 $display("LSR: term1 = %b, alu_out = %b, zero = %b", term1, alu_out, zero);
    $display("LSR: term1 = %d, alu_out = %d, zero = %d", term1, alu_out, zero);
    $display("");

    opcode = 6'b001001; // LSL
    #10 $display("LSL: term1 = %b, alu_out = %b, zero = %b", term1, alu_out, zero);
    $display("LSL: term1 = %d, alu_out = %d, zero = %d", term1, alu_out, zero);
    $display("");

    opcode = 6'b001010; // RSR
    #10 $display("RSR: term1 = %b, alu_out = %b, zero = %b", term1, alu_out, zero);
    $display("RSR: term1 = %d, alu_out = %d, zero = %d", term1, alu_out, zero);
    $display("");

    opcode = 6'b001011; // RSL
    #10 $display("RSL: term1 = %b, alu_out = %b, zero = %b", term1, alu_out, zero);
    $display("RSL: term1 = %d, alu_out = %d, zero = %d", term1, alu_out, zero);
    $display("");

    opcode = 6'b000111; // MOV
    #10 $display("MOV: term1 = %b, alu_out = %b, zero = %b", term1, alu_out, zero);
    $display("MOV: term1 = %d, alu_out = %d, zero = %d", term1, alu_out, zero);
    $display("");

    //term1 = 16'b1010101;
    //term2 = 16'b00000101;

    opcode = 6'b010011; // MUL
    #10 $display("MUL: term1 = %b, term2 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b, carry = %b", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("MUL: term1 = %d, term2 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d, carry = %d", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("");

    opcode = 6'b010100; // DIV
    #10 $display("DIV: term1 = %b, term2 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b, carry = %b", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("DIV: term1 = %d, term2 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d, carry = %d", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("");

    opcode = 6'b010101; // MOD
    #10 $display("MOD: term1 = %b, term2 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b, carry = %b", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("MOD: term1 = %d, term2 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d, carry = %d", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("");

    opcode = 6'b001100; // AND
    #10 $display("AND: term1 = %b, term2 = %b, alu_out = %b, zero = %b", term1, term2, alu_out, zero);
    $display("AND: term1 = %d, term2 = %d, alu_out = %d, zero = %d", term1, term2, alu_out, zero);
    $display("");

    opcode = 6'b001101; // OR
    #10 $display("OR: term1 = %b, term2 = %b, alu_out = %b, zero = %b", term1, term2, alu_out, zero);
    $display("OR: term1 = %d, term2 = %d, alu_out = %d, zero = %d", term1, term2, alu_out, zero);
    $display("");

    opcode = 6'b001110; // XOR
    #10 $display("XOR: term1 = %b, term2 = %b, alu_out = %b, zero = %b", term1, term2, alu_out, zero);
    $display("XOR: term1 = %d, term2 = %d, alu_out = %d, zero = %d", term1, term2, alu_out, zero);
    $display("");

    opcode = 6'b010110; // CMP
    #10 $display("CMP: term1 = %b, term2 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b, carry = %b", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("CMP: term1 = %d, term2 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d, carry = %d", term1, term2, alu_out, zero, negative, overflow, carry);
    $display("");

    opcode = 6'b010111; // TEST
    #10 $display("TEST: term1 = %b, term2 = %b, alu_out = %b, zero = %b", term1, term2, alu_out, zero);
    $display("TEST: term1 = %d, term2 = %d, alu_out = %d, zero = %d", term1, term2, alu_out, zero);
    $display("");

    opcode = 6'b011000; // INC
    #10 $display("INC: term1 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b", term1, alu_out, zero, negative, overflow);
    $display("INC: term1 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d", term1, alu_out, zero, negative, overflow);
    $display("");

    opcode = 6'b011001; // DEC
    #10 $display("DEC: term1 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b", term1, alu_out, zero, negative, overflow);
    $display("DEC: term1 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d", term1, alu_out, zero, negative, overflow);
    $display("");

    store = 1;
    #10 $display("STO: term1 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b", term1, alu_out, zero, negative, overflow);
    $display("STO: term1 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d", term1, alu_out, zero, negative, overflow);
    $display("");
    store = 0;
    opcode = 6'b000000; // NOP
    #10 $display("NOP: term1 = %b, alu_out = %b, zero = %b, negative = %b, overflow = %b", term1, alu_out, zero, negative, overflow);
    $display("NOP: term1 = %d, alu_out = %d, zero = %d, negative = %d, overflow = %d", term1, alu_out, zero, negative, overflow);
    $display("");

    #10 $finish;
    end

endmodule