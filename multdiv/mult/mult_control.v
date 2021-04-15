module mult_control (counter, mc, mp, curr_product_right, helper, data_resultRDY, first, control_out);

    input [4:0] counter;
    input [31:0] mc, mp, curr_product_right;
    input helper;

    output data_resultRDY, first;
    output [31:0] control_out;

    // assign select bits
    wire [2:0] select;
    assign select[0] = helper;
    assign select[1] = curr_product_right[0];
    assign select[2] = curr_product_right[1];

    wire [31:0] neg_mc;
    negate negate_mc (mc, neg_mc);

    wire signed [31:0] shift_mc;
    wire [31:0] neg_shift_mc;
    assign shift_mc = mc << 1;
    negate negate_shift_mc (shift_mc, neg_shift_mc);

    wire [31:0] zeros;
    assign zeros = 32'b00000000000000000000000000000000;

    // control
    // 000 --> +0
    // 001 --> + mc
    // 010 --> + mc
    // 011 --> + mc<<1
    // 100 --> - mc<<1
    // 101 --> - mc
    // 110 --> - mc
    // 111 --> +0
    mux_8 control_mux (control_out, select, zeros, mc, mc, shift_mc, neg_shift_mc, neg_mc, neg_mc, zeros);

    // data_resultRDY = 1 when counter = 17
    assign data_resultRDY = counter[4] && ~counter[3] && ~counter[2] && ~counter[1] && counter[0];

    // first = 1 when counter = 0
    assign first = ~counter[4] && ~counter[3] && ~counter[2] && ~counter[1] && ~counter[0];
    
endmodule