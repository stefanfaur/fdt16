module InstrMem_tb;
    reg clk;
    reg en_write;
    reg [9:0] program_counter;
    reg [15:0] data_in;
    wire [15:0] data_out;

    InstrMem dut (
        .clk(clk),
        .en_write(en_write),
        .program_counter(program_counter),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        en_write = 0;
        program_counter = 0;
        data_in = 0;

        // Write instructions to memory
        en_write = 1;
        data_in = 16'h1234;
        #10;
        en_write = 0;

        // Read instruction from memory
        program_counter = 0;
        #10;
        $display("Instruction at program counter 0: %h", data_out);

        // Write another instruction to memory
        en_write = 1;
        data_in = 16'h5678;
        #10;
        en_write = 0;

        // Read the new instruction from memory
        program_counter = 0;
        #10;
        $display("Instruction at program counter 0: %h", data_out);

        // Write instruction at a different program counter
        program_counter = 10;
        en_write = 1;
        data_in = 16'hABCD;
        #10;
        en_write = 0;

        // Read the instruction at the new program counter
        program_counter = 10;
        #10;
        $display("Instruction at program counter 10: %h", data_out);

        // Write instruction at a different program counter
        program_counter = 100;
        en_write = 1;
        data_in = 16'hFFFF;
        #10;
        en_write = 0;

        // Read the instruction at the new program counter
        program_counter = 100;
        #10;
        $display("Instruction at program counter 100: %h", data_out);

        $finish;
    end

    always #5 clk = ~clk;
endmodule