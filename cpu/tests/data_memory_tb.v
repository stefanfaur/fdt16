`timescale 1ns / 1ps

module DataMemory_tb;

    reg [15:0] data_in;
    reg [15:0] sp;
    reg [8:0] address;
    reg clk;
    reg store, load, push, pop;

    wire [15:0] data_out;

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

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        store = 0;
        load = 0;
        push = 0;
        pop = 0;
        data_in = 16'b0;
        sp = 16'b0;
        address = 9'b0;

        #10 store = 1;
        #10 data_in = 16'b1010101010101010;
        #10 address = 9'b000000001;
        #10 store = 0;

        #10 load = 1;
        #10 $display("data_out (load) = %b", data_out);
        #10 load = 0;

        #10 push = 1;
        #10 data_in = 16'b1111000011110000;
        #10 sp = 16'b0000000000000010;
        #10 push = 0;

        #10 pop = 1;
        #10 $display("data_out (pop) = %b", data_out);
        #10 pop = 0;

        #10 $finish;
    end

endmodule