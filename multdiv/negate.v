module negate(in, out);

    input [31:0] in;
    output [31:0] out;

    wire [31:0] not_in, one;
    wire c_in;
    assign not_in = ~in;
    assign one = 32'b1;
    assign c_in = 1'b0;

    mult_adder add (not_in, one, c_in, out);

endmodule