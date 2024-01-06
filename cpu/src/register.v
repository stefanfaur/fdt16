module Register #(parameter WIDTH = 16) (
    input wire [WIDTH-1:0] in,
    input wire clk,
    input wire reset,
    input wire load, 
    output reg [WIDTH-1:0] out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 0;
        else if (load)
            out <= in;
    end

endmodule
