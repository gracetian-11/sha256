module not_eq(eq, add_result);

    input [31:0] add_result;
    output eq;

    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29;

    or or0 (w0, add_result[0], add_result[1]);
    or or1 (w1, w0, add_result[2]);
    or or2 (w2, w1, add_result[3]);
    or or3 (w3, w2, add_result[4]);
    or or4 (w4, w3, add_result[5]);
    or or5 (w5, w4, add_result[6]);
    or or6 (w6, w5, add_result[7]);
    or or7 (w7, w6, add_result[8]);
    or or8 (w8, w7, add_result[9]);
    or or9 (w9, w8, add_result[10]);
    or or10 (w10, w9, add_result[11]);
    or or11 (w11, w10, add_result[12]);
    or or12 (w12, w11, add_result[13]);
    or or13 (w13, w12, add_result[14]);
    or or14 (w14, w13, add_result[15]);
    or or15 (w15, w14, add_result[16]);
    or or16 (w16, w15, add_result[17]);
    or or17 (w17, w16, add_result[18]);
    or or18 (w18, w17, add_result[19]);
    or or19 (w19, w18, add_result[20]);
    or or20 (w20, w19, add_result[21]);
    or or21 (w21, w20, add_result[22]);
    or or22 (w22, w21, add_result[23]);
    or or23 (w23, w22, add_result[24]);
    or or24 (w24, w23, add_result[25]);
    or or25 (w25, w24, add_result[26]);
    or or26 (w26, w25, add_result[27]);
    or or27 (w27, w26, add_result[28]);
    or or28 (w28, w27, add_result[29]);
    or or29 (w29, w28, add_result[30]);
    or or30 (eq, w29, add_result[31]);

endmodule