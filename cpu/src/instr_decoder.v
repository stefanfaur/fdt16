module InstrDecoder(
    input [15:0] instr,
    output wire [8:0] immed,
    output wire regid,
    output wire [5:0] opcode
);

    assign immed = instr[15:7]; // First 9 bits for immediate
    assign regid = instr[6];    // 1 bit for register id
    assign opcode = instr[5:0]; // Remaining 6 bits for opcode

endmodule