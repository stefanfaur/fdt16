`timescale 1ns / 1ps

module PC_tb;

    reg [8:0] branch_address;
    reg branch, stall, clk, reset;

    wire [10:0] pc_out;

    PC uut (
        .branch_address(branch_address),
        .branch(branch),
        .stall(stall),
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        reset = 1;
        branch = 0;
        stall = 0;
        branch_address = 9'b0;

        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        #10 $display("pc_out = %b", pc_out);
        #10 $display("pc_out = %b", pc_out);
        #10 $display("pc_out = %b", pc_out);

        #10 branch = 1;
        #10 branch_address = 9'b000100011;
        #10 $display("pc_out = %b", pc_out);
        #10 branch = 0;

        #10 $display("pc_out = %b", pc_out);

        #10 $display("pc_out = %b", pc_out);
        #10 $display("pc_out = %b", pc_out);
        #10 $display("pc_out = %b", pc_out);

        #10 $finish;
    end

endmodule