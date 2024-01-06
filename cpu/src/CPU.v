`include "PC.v"
`include "InstrMem.v"
`include "InstrDecoder.v"
`include "DataMemory.v"
`include "StackPointer.v"
`include "ALU.v"
`include "Flags.v"
`include "SignExtend.v"
`include "MUX.v"
`include "Register.v"
`include "Acc.v"
`include "Decoder1to2.v"

module CPU;

reg clk, reset, start;



PC pc(
    .branch_address(immed),///
    .branch(branch), // branch overwrite enable, control unit
    .stall(stall), // control unit
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out)///
);

wire [10:0] pc_out;///

reg [15:0] instr_data_in; // later used for writing the program into memory
reg instr_mem_en_write; // later used for writing the program into memory 

InstrMem instr_mem(
    .clk(clk),
    .en_write(instr_mem_en_write),///
    .program_counter(pc_out),///
    .data_in(instr_data_in),///
    .data_out(instr_out)///
);

wire [15:0] instr_out;///

InstrDecoder instr_decoder(
    .instr(instr_out),///
    .immed(immed),///
    .regid(regid),///
    .opcode(decoded_opcode)///
);

Acc acc(
    .data_in(acc_in),///
    .clk(clk),
    .reset(reset),
    .acc_enable(acc_enable),
    .data_out(acc_out)///
);

wire [15:0] acc_in;///
wire [15:0] acc_out;///

Register #(16) x_reg(
    .in(x_reg_in),
    .load(load),    // control signal
    .clk(clk),
    .reset(reset),
    .out(x_reg_out)///
);

Register #(16) y_reg(
    .in(y_reg_in),
    .load(load),    // control signal
    .clk(clk),
    .reset(reset),
    .out(y_reg_out)///
);

Mux3to1 mux3to1(
    .sel(immed[1:0]),// immed[1:0] because we only use the 2 least significant bits of immed to select the register (implemented in assembler)
    .in0(acc_out), /// 
    .in1(x_reg_out),///
    .in2(y_reg_out),///
    .out(reg_data)///
);

wire [15:0] reg_data;///

Decoder1to2 decoder_1to2(
    .reg_select(regid),
    .reg_data(selected_data),///
    .output0(x_reg_in),///
    .output1(y_reg_in)///
);

wire [15:0] x_reg_in;///
wire [15:0] y_reg_in;///
wire [15:0] x_reg_out;///
wire [15:0] y_reg_out;///
wire regid;///

Mux2to1 mux2to1(
    .sel(regid),///
    .in0(x_reg_out), // register x
    .in1(y_reg_out), // register y
    .out(work_reg) // 
);

wire [15:0] work_reg;///

Mux2to1 mux2to1_data_mem_in(
    .sel(store/pushpc),// control unit i guess
    .in0({5'b0, pc_out}),///
    .in1(work_reg), // WorkReg
    .out(data_memory_in)///
);

wire [15:0] data_memory_in;///

wire [5:0] decoded_opcode;///

wire [8:0] immed;///

SignExtend sign_extend(
    .immed(immed),
    .ext_immed(ext_immed)///
);

wire [15:0] ext_immed;///


DataMemory data_memory(
    .data_in(data_memory_in), // input will be MUXed between PC(on Push PC on JMP) and WorkReg(on store)
    .sp(stack_ptr),///
    .address(immed),/// immed because it is only used on store
    .clk(clk),
    .store(store),
    .load(load),
    .push(push),///
    .pop(pop),///
    .data_out(data_out)
);

wire [15:0] stack_ptr;///
wire push, pop;///

Mux2to1 mux2to1_load_from_mem_or_reg(
    .sel(~~~~~), // control depending on MOV or LOAD instruction
    .in0(data_out),///
    .in1(reg_data),///
    .out(selected_data)///
);

wire [15:0] selected_data;///

StackPointer stack_pointer(
    .pop(pop),///
    .push(push),///
    .reset(reset),
    .clk(clk),
    .out(stack_ptr)///
);

wire alu_zero, alu_negative, alu_carry, alu_overflow;

ALU alu(
    .store(store),
    .term1(ext_immed),///
    .term2(term2),
    .opcode(opcode),
    .alu_out(acc_in),///
    .zero(alu_zero),///
    .negative(alu_negative),///
    .overflow(alu_overflow),///
    .carry(alu_carry)///
);

Flags flags(
    .clk(clk),
    .reset(reset),
    .flags_en(flags_en),
    .alu_zero(alu_zero),///
    .alu_negative(alu_negative),///
    .alu_carry(alu_carry),///
    .alu_overflow(alu_overflow),///
    .zero_flag(zero_flag),
    .negative_flag(negative_flag),
    .carry_flag(carry_flag),
    .overflow_flag(overflow_flag)
);



endmodule