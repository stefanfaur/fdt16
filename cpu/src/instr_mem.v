module InstrMem(
    input clk,
    input en_write,
    input [9:0] program_counter,
    input [15:0] data_in,
    output [15:0] data_out
);
    reg [15:0] memory [0:2047];

    always @(posedge clk) begin // using this we can write instructions into memory
        if(en_write)
            memory[program_counter] <= data_in;
    end

    // when not writing to the memory, it always outputs the instruction at the program counter
    assign data_out = (en_write) ? 0 : memory[program_counter];
endmodule