`timescale 1ns / 1ps

module StackPointer_tb();

    reg pop, push, reset, clk;
    wire [15:0] out;
    StackPointer sp_instance(.pop(pop), .push(push), .reset(reset), .clk(clk), .out(out));

    always #10 clk = ~clk; // 50 MHz Clock

    initial begin
        clk = 0;
        reset = 0;
        push = 0;
        pop = 0;

        $dumpfile("waveform.vcd");
        $dumpvars(0, StackPointer_tb);


        #20 reset = 1;
        #20 reset = 0;

        #20 push = 1;
        #20 push = 0;

        #20 pop = 1;
        #20 pop = 0;

        #20 push = 1;
        #20 push = 0;
        #20 push = 1;
        #20 push = 1;
        #20 push = 1;
        #20 push = 0;
        #20 pop = 1;
        #20 pop = 0;


        #100 $finish;
    end

    initial begin
        $monitor("Time = %t, Reset = %b, Push = %b, Pop = %b, SP = %h", 
                  $time, reset, push, pop, out);
    end

endmodule
