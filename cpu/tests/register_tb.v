`timescale 1ns / 1ps

module Register_tb;

    // Declare wires for the inputs
    reg clk;
    reg reset;
    reg [15:0] in;

    // Declare wires for the outputs
    wire [15:0] out;

    // Instantiate the Register module
    Register #(16) uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .out(out)
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
        in = 16'b0;

        // Apply reset
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Apply some inputs
        #10 in = 16'b1010101010101010;
        #10 $display("out = %b", out);
        #10 in = 16'b1111000011110000;
        #10 $display("out = %b", out);
        #10 in = 16'b0101010101010101;
        #10 $display("out = %b", out);
        #10 in = 16'b0000111100001111;
        #10 $display("out = %b", out);

        // End the simulation
        #10 $finish;
    end

endmodule