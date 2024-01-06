`timescale 1ns / 1ps

module Decoder1to2_tb;

    // Declare wires for the inputs
    reg enable, reg_id;

    // Declare wires for the outputs
    wire output0, output1;

    // Instantiate the Decoder_1to2 module
    Decoder1to2 uut (
        .enable(enable),
        .reg_id(reg_id),
        .output0(output0),
        .output1(output1)
    );

    // Test procedure
    initial begin
        // Initialize inputs
        enable = 0;
        reg_id = 0;

        // Test each possible input combination
        #10 $display("enable = %b, reg_id = %b, output0 = %b, output1 = %b", enable, reg_id, output0, output1);

        enable = 1;
        reg_id = 0;
        #10 $display("enable = %b, reg_id = %b, output0 = %b, output1 = %b", enable, reg_id, output0, output1);

        enable = 0;
        reg_id = 1;
        #10 $display("enable = %b, reg_id = %b, output0 = %b, output1 = %b", enable, reg_id, output0, output1);

        enable = 1;
        reg_id = 1;
        #10 $display("enable = %b, reg_id = %b, output0 = %b, output1 = %b", enable, reg_id, output0, output1);

        // End the simulation
        #10 $finish;
    end

endmodule