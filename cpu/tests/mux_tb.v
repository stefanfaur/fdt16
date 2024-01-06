module Mux4to1_tb;

    reg [15:0] in0, in1, in2, in3;
    reg [1:0] sel;
    wire [15:0] out;

    Mux4to1 dut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test case 1
        in0 = 16'h1234;
        in1 = 16'h5678;
        in2 = 16'h9ABC;
        in3 = 16'hDEF0;
        sel = 2'b00;
        #10;
        $display("sel = %b ---> out = %h", sel, out);

        // Test case 2
        in0 = 16'h1234;
        in1 = 16'h5678;
        in2 = 16'h9ABC;
        in3 = 16'hDEF0;
        sel = 2'b01;
        #10;
        $display("sel = %b ---> out = %h", sel, out);

        // Test case 3
        in0 = 16'h1234;
        in1 = 16'h5678;
        in2 = 16'h9ABC;
        in3 = 16'hDEF0;
        sel = 2'b10;
        #10;
        $display("sel = %b ---> out = %h", sel, out);

        // Test case 4
        in0 = 16'h1234;
        in1 = 16'h5678;
        in2 = 16'h9ABC;
        in3 = 16'hDEF0;
        sel = 2'b11;
        #10;
        $display("sel = %b ---> out = %h", sel, out);
        
        $finish;
    end

endmodule