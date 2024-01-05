module Flags (
    input wire clk,
    input wire reset,
    input wire flags_en,
    input wire alu_zero,
    input wire alu_negative,
    input wire alu_carry,
    input wire alu_overflow,
    output reg zero_flag,
    output reg negative_flag,
    output reg carry_flag,
    output reg overflow_flag
);
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            zero_flag <= 1'b0;
            negative_flag <= 1'b0;
            carry_flag <= 1'b0;
            overflow_flag <= 1'b0;
        end else if (flags_en) begin
            zero_flag <= alu_zero;
            negative_flag <= alu_negative;
            carry_flag <= alu_carry;
            overflow_flag <= alu_overflow;
        end
    end
    
endmodule
