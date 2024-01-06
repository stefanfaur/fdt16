module DataMemory(
    input [15:0] data_in,
    input [15:0] sp, // stack pointer
    input [8:0] address,
    input clk,
    input store, load, push, pop,
    output reg [15:0] data_out
);

    reg [15:0] memory [0:65535]; // 64K memory locations of 16 bits each

    always @(posedge clk) begin
        if (store)                  // mem operations
            memory[address] <= data_in;
        else if (load)
            data_out <= memory[address];
        else if (push)              // stack operations
            memory[sp] <= data_in;
        else if (pop)
            data_out <= memory[sp];
    end

endmodule