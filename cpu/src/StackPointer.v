module StackPointer(
    input pop, push, reset, clk,
    output reg [15:0] out
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 16'hFFFF;  // Reset value
        else if (push)
            out <= out - 1;  // Decrement SP on push
        else if (pop)
            out <= out + 1;  // Increment SP on pop
    end

endmodule
