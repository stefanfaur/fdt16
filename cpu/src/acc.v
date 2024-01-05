module Acc (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [15:0] data_in,
    output wire [15:0] data_out
);

    reg [15:0] acc;

    always @(posedge clk or posedge reset) begin
        if (reset)
            acc <= 16'b0;
        else if (enable)
            acc <= data_in;
    end

    assign data_out = acc;

endmodule
