`timescale 1ns / 1ps

module PC_tb;

    // Declare wires for the inputs
    reg [8:0] branch_address;
    reg branch, stall, clk, reset;

    // Declare wires for the outputs
    wire [8:0] pc_out;

    // Instantiate the PC module
    PC uut (
        .branch_address(branch_address),
        .branch(branch),
        .stall(stall),
        .clk(clk),
        .reset(reset),
        .pc_out(pc_out)
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
        branch = 0;
        stall = 0;
        branch_address = 9'b0;

        // Apply reset
        #10 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Let the counter increment for several clocks
        #10 $display("pc_out = %b", pc_out);
        #10 $display("pc_out = %b", pc_out);
        #10 $display("pc_out = %b", pc_out);

        // Perform a branch
        #10 branch = 1;
        #10 branch_address = 9'b000100011;
        #10 $display("pc_out = %b", pc_out);
        #10 branch = 0;

        // Check the counter after the branch
        #10 $display("pc_out = %b", pc_out);

        // Let the counter increment for several clocks after the branch
        #10 $display("pc_out = %b", pc_out);
        #10 $display("pc_out = %b", pc_out);
        #10 $display("pc_out = %b", pc_out);

        // End the simulation
        #10 $finish;
    end

endmodule