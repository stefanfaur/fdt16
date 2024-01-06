`timescale 1ns / 1ps

module Acc_tb;

    // Declare wires for the inputs
    reg clk;
    reg reset;
    reg enable;
    reg [15:0] data_in;

    // Declare wires for the outputs
    wire [15:0] data_out;

    // Instantiate the Acc module
    Acc uut (
        .clk(clk),
        .reset(reset),
        .acc_enable(enable),
        .data_in(data_in),
        .data_out(data_out)
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
        enable = 0;
        data_in = 16'b0;

        // Apply reset
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Apply some inputs and enable the accumulator
        #10 enable = 1;
        #10 data_in = 16'b1010101010101010;
        #10 $display("data_out = %b", data_out);
        #10 data_in = 16'b1111000011110000;
        #10 $display("data_out = %b", data_out);

        // End the simulation
        #10 $finish;
    end

endmodule