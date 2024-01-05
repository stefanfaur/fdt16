module SignExtend (
    input [8:0] immed,
    output reg [15:0] ext_immed
);

    always @(*) begin
        if (immed[8] == 1) begin
            ext_immed = {7'b1000000, immed};
            ext_immed[8] = 0;
        end else begin
            ext_immed = {7'b0000000, immed};
        end
    end

endmodule
