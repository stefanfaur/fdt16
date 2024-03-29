module Acc (
    input wire clk,
    input wire reset,
    input wire acc_enable,
    input wire [15:0] data_in, // this will be alu_out
    output wire [15:0] data_out
);

    reg [15:0] acc;

    always @(posedge clk or posedge reset) begin
        if (reset)
            acc <= 16'b0;
        else if (acc_enable)
            acc <= data_in;
    end

    assign data_out = acc;

endmodule
