module SignExtend_tb;
    reg [8:0] immed;
    wire [15:0] ext_immed;

    // Instantiate the Unit Under Test (UUT)
    Sign_extend uut (
        .immed(immed), 
        .ext_immed(ext_immed)
    );

    initial begin
        // Initialize input
        immed = 0;
        #10;
        // Apply input values
        immed = 9'b000000001;
        #10;
        immed = 9'b100000000;
        #10;
        immed = 9'b111111111;
        #10;

        // Finish simulation
        $finish;
    end

    initial begin
        $monitor("At time %d, immed = %b, ext_immed = %b", $time, immed, ext_immed);
    end
endmodule