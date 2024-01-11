`timescale 1ns / 1ps

module Acc_tb;

    reg clk;
    reg reset;
    reg enable;
    reg [15:0] data_in;

    wire [15:0] data_out;

    Acc uut (
        .clk(clk),
        .reset(reset),
        .acc_enable(enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    always begin
        #5 clk = ~clk;
    end


    initial begin
        clk = 0;
        reset = 1;
        enable = 0;
        data_in = 16'b0;

        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        #10 enable = 1;
        #10 data_in = 16'b1010101010101010;
        #10 $display("data_out = %b", data_out);
        #10 data_in = 16'b1111000011110000;
        #10 $display("data_out = %b", data_out);

        #10 $finish;
    end

endmodule