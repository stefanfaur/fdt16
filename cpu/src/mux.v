module Mux2to1(
    input [15:0] in0,
    input [15:0] in1,
    input sel,
    output [15:0] out
);
    assign out = sel ? in0 : in1;

endmodule

module Mux4to1(
    input [15:0] in0,
    input [15:0] in1,
    input [15:0] in2,
    input [15:0] in3,
    input [1:0] sel,
    output reg [15:0] out
);

    always @*
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = 16'b0; // Default case, output 0
        endcase

endmodule

module Mux6to1(
    input [15:0] in0,
    input [15:0] in1,
    input [15:0] in2,
    input [15:0] in3,
    input [15:0] in4,
    input [15:0] in5,
    input [2:0] sel,
    output reg [15:0] out
);

    always @*
        case (sel)
            3'b000: out = in0;
            3'b001: out = in1;
            3'b010: out = in2;
            3'b011: out = in3;
            3'b100: out = in4;
            3'b101: out = in5;
            default: out = 6'b0; // Default case, output 0
        endcase

endmodule
