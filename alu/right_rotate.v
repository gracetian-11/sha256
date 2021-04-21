module right_rotate(in, out, rotate_amt);
    // rotates input right by rotate_amt

    input [31:0] in;
    input [4:0] rotate_amt;

    output [31:0] out;

    wire [31:0] r1, r2, r4, r8, r16;
    wire [31:0] mux1, mux2, mux3, mux4;

    // if 4th bit of rotate_amt is on, rotate input by 16 bits
    rotate_16 first_rotate(.in(in), .out(r16));
    assign mux1 = rotate_amt[4] ? r16 : in;

    // if 3rd bit of rotate_amt is on, rotate output of last mux by 8 bits (either r16 or in)
    rotate_8 second_rotate(.in(mux1), .out(r8));
    assign mux2 = rotate_amt[3] ? r8 : mux1;

    // if 2nd bit of rotate_amt is on, rotate output of last mux by 4 bits (either r8 or mux2)
    rotate_4 third_rotate(.in(mux2), .out(r4));
    assign mux3 = rotate_amt[2] ? r4 : mux2;

    // if 1st bit of rotate_amt is on, rotate output of last mux by 2 bits (either r4 or mux2)
    rotate_2 fourth_rotate(.in(mux3), .out(r2));
    assign mux4 = rotate_amt[1] ? r2 : mux3;

    // if 0th bit of rotate_amt is on, rotate output of last mux by 1 bit (either r2 or mux3)
    rotate_1 fifth_rotate(.in(mux4), .out(r1));
    assign out = rotate_amt[0] ? r1 : mux4;

endmodule

module rotate_1(in, out);
    // rotates input right by 1 bit

    input[31:0] in;
    output[31:0] out;

    wire [30:0] body;
    assign body = in[31:1];

    assign out[30:0] = body;
    assign out[31] = in[0];

endmodule

module rotate_2(in, out);
    // rotates input right by 2

    input[31:0] in;
    output[31:0] out;

    wire [31:0] r1;
    rotate_1 first (in, r1);
    rotate_1 second (r1, out);

endmodule

module rotate_4(in, out);
    // rotates input right by 4

    input [31:0] in;
    output [31:0] out;

    wire [31:0] r2;
    rotate_2 first (in, r2);
    rotate_2 second (r2, out);

endmodule

module rotate_8(in, out);
    // rotates input right by 8

    input [31:0] in;
    output [31:0] out;

    wire [31:0] r4;
    rotate_4 first (in, r4);
    rotate_4 second (r4, out);

endmodule

module rotate_16(in, out);
    // rotates input right by 16

    input [31:0] in;
    output [31:0] out;

    wire [31:0] r8;
    rotate_8 first (in, r8);
    rotate_8 second (r8, out);

endmodule