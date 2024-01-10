module ALU(
    input store,
    input [15:0] term1, term2,
    input [5:0] opcode,
    output reg [15:0] alu_out,
    output reg zero, negative, overflow, carry, flags_en
);

always @(*) begin
    if (store) alu_out = term1;
    else begin
        flags_en = 1'b1;
    case (opcode)
        6'b010001: begin // ADD
            alu_out = term1 + term2;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = (term1[15] == term2[15]) && (term1[15] != alu_out[15]);
            carry = (term1 + term2) > 16'hFFFF;
        end
        6'b010010: begin // SUB
            alu_out = term1 - term2;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = (term1[15] != term2[15]) && (term1[15] != alu_out[15]);
            carry = term1 < term2;
        end
        6'b010110: begin // CMP
            alu_out = term1 - term2; // basically SUB but doesn't store result
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = (term1[15] != term2[15]) && (term1[15] != alu_out[15]);
            carry = term1 < term2;
        end
        6'b010111: begin // TST
            alu_out = term1 & term2; // tests using bitwise AND
            zero = (alu_out == 0);
            negative = 1'b0;
            overflow = 1'b0;
            carry = 1'b0;
        end
        6'b011000: begin // INC
            alu_out = term1 + 1;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = (term1[15] == 1'b0) && (alu_out[15] == 1'b1);
            carry = 1'b0;
        end
        6'b011001: begin // DEC
            alu_out = term1 - 1;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = (term1[15] == 1'b1) && (alu_out[15] == 1'b0);
            carry = 1'b0;
        end
        6'b001000: begin // LSR
            alu_out = term1 >> term2;
            zero = (alu_out == 0);
            negative = 1'b0;
            overflow = 1'b0;
            carry = term1[0];
        end
        6'b001001: begin // LSL
            alu_out = term1 << term2;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = alu_out[15] ^ term1[14];
            carry = term1[15];
        end
        6'b001010: begin // RSR
            alu_out = term1 >> term2 | term1 << (16-term2);
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = 1'b0;
            carry = term1[term2];
        end
        6'b001011: begin // RSL
            alu_out = term1 << term2 | term1 >> (16-term2);
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = alu_out[15] ^ term1[14];
            carry = term1[term2];
        end
        6'b000111: begin // MOV
            alu_out = term1;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = 1'b0;
            carry = 1'b0;
        end
        6'b010011: begin // MUL
            alu_out = term1 * term2;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = term1!=0 && alu_out/term1 != term2;
            carry = 1'b0;
        end
        6'b010100: begin // DIV
            alu_out = term1 / term2;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = 1'b0;
            carry = 1'b0;
        end
        6'b010101: begin // MOD
            alu_out = term1 % term2;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = 1'b0;
            carry = 1'b0;
        end
        6'b001100: begin // AND
            alu_out = term1 & term2;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = 1'b0;
            carry = 1'b0;
        end
        6'b001101: begin // OR
            alu_out = term1 | term2;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = 1'b0;
            carry = 1'b0;
        end
        6'b001110: begin // XOR
            alu_out = term1 ^ term2;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = 1'b0;
            carry = 1'b0;
        end
        6'b001111: begin // NOT
            alu_out = ~term1;
            zero = (alu_out == 0);
            negative = alu_out[15];
            overflow = 1'b0;
            carry = 1'b0;
        end

        default: begin
            alu_out = 16'b0;
            zero = 1'b0;
            negative = 1'b0;
            overflow = 1'b0;
            carry = 1'b0;
        end  
    endcase
    flags_en = 1'b0;
    end
end

endmodule