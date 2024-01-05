`timescale 1ns / 1ps

module DataMemory_tb;

    // Declare wires for the inputs
    reg [15:0] data_in;
    reg [15:0] sp;
    reg [8:0] address;
    reg clk;
    reg store, load, push, pop;

    // Declare wires for the outputs
    wire [15:0] data_out;

    // Instantiate the DataMemory module
    DataMemory uut (
        .data_in(data_in),
        .sp(sp),
        .address(address),
        .clk(clk),
        .store(store),
        .load(load),
        .push(push),
        .pop(pop),
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
        store = 0;
        load = 0;
        push = 0;
        pop = 0;
        data_in = 16'b0;
        sp = 16'b0;
        address = 9'b0;

        // Apply some inputs and perform store operation
        #10 store = 1;
        #10 data_in = 16'b1010101010101010;
        #10 address = 9'b000000001;
        #10 store = 0;

        // Perform load operation
        #10 load = 1;
        #10 $display("data_out (load) = %b", data_out);
        #10 load = 0;

        // Perform push operation
        #10 push = 1;
        #10 data_in = 16'b1111000011110000;
        #10 sp = 16'b0000000000000010;
        #10 push = 0;

        // Perform pop operation
        #10 pop = 1;
        #10 $display("data_out (pop) = %b", data_out);
        #10 pop = 0;

        // End the simulation
        #10 $finish;
    end

endmodule