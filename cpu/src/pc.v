module PC(
    input [8:0] branch_address,
    input branch, stall, clk, reset,
    output reg [8:0] pc_out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 0;
        else if (branch && !stall)
            pc_out <= branch_address;
        else if (!stall && !branch)
            pc_out <= pc_out + 1;
    end

endmodule