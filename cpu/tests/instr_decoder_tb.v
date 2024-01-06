module testbench;
    reg [15:0] instr;
    wire [8:0] immed;
    wire regid;
    wire [5:0] opcode;

    InstrDecoder uut (
        .instr(instr), 
        .immed(immed),
        .regid(regid),
        .opcode(opcode)
    );

    initial begin
        
        instr = 16'b0000000000000000;
        #10;
        instr = 16'b1111111111111111;
        #10;
        instr = 16'b1000000000000001; 
        #10;

        $finish;
    end

    initial begin
        $monitor("At time %d, instr = %b, immed = %b, regid = %b, opcode = %b", $time, instr, immed, regid, opcode);
    end
endmodule