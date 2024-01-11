`timescale 1ns / 1ps

module Decoder1to2_tb;

    reg reg_select;
    reg [15:0] reg_data;

    wire [15:0] output0, output1;

    Decoder1to2 uut (
        .reg_select(reg_select),
        .reg_data(reg_data),
        .output0(output0),
        .output1(output1)
    );

    initial begin
        reg_select = 0;
        reg_data = 16'b0;

        #10 $display("reg_select = %b, reg_data = %b, output0 = %b, output1 = %b", reg_select, reg_data, output0, output1);

        reg_select = 1;
        reg_data = 16'b0;
        #10 $display("reg_select = %b, reg_data = %b, output0 = %b, output1 = %b", reg_select, reg_data, output0, output1);

        reg_select = 0;
        reg_data = 16'b1;
        #10 $display("reg_select = %b, reg_data = %b, output0 = %b, output1 = %b", reg_select, reg_data, output0, output1);

        reg_select = 1;
        reg_data = 16'b1;
        #10 $display("reg_select = %b, reg_data = %b, output0 = %b, output1 = %b", reg_select, reg_data, output0, output1);

        #10 $finish;
    end

endmodule