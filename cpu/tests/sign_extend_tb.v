module SignExtend_tb;
    reg [8:0] immed;
    wire [15:0] ext_immed;

    SignExtend uut (
        .immed(immed), 
        .ext_immed(ext_immed)
    );

    initial begin
        immed = 0;
        #10;
        immed = 9'b000000001;
        #10;
        immed = 9'b100000000;
        #10;
        immed = 9'b111111111;
        #10;

        $finish;
    end

    initial begin
        $monitor("At time %d, immed = %b, ext_immed = %b", $time, immed, ext_immed);
    end
endmodule