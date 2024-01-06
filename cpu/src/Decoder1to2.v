module Decoder1to2 (
    input wire reg_select,
    input wire [15:0] reg_data,
    output wire [15:0] output1,
    output wire [15:0] output0
);

    assign output0 = reg_select & ~reg_data;
    assign output1 = reg_select & reg_data;

endmodule
