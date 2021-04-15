module mult_adder_cla(A, B, c_in, sum, G, P);

    input [7:0] A, B;
    input c_in;
    output [7:0] sum;
    output G, P;

    // g_i and p_i signals

    wire g_0, p_0;
    and g0 (g_0, A[0], B[0]);
    or p0 (p_0, A[0], B[0]);

    wire g_1, p_1;
    and g1( g_1, A[1], B[1]);
    or p1( p_1, A[1], B[1]);

    wire g_2, p_2;
    and g2( g_2, A[2], B[2]);
    or p2( p_2, A[2], B[2]);

    wire g_3, p_3;
    and g3( g_3, A[3], B[3]);
    or p3( p_3, A[3], B[3]);

    wire g_4, p_4;
    and g4( g_4, A[4], B[4]);
    or p4( p_4, A[4], B[4]);

    wire g_5, p_5;
    and g5( g_5, A[5], B[5]);
    or p5( p_5, A[5], B[5]);

    wire g_6, p_6;
    and g6( g_6, A[6], B[6]);
    or p6( p_6, A[6], B[6]);

    wire g_7, p_7;
    and g7( g_7, A[7], B[7]);
    or p7( p_7, A[7], B[7]);

    // c_i signals

    wire c_1; // c1 = g0 + p0 * c0
    wire w1;
    and and1 (w1, p_0, c_in);
    or or1 (c_1, g_0, w1);

    wire c_2; // c2 = g1 + p1 * g0 + p1 * p0 * c0
    wire w21, w22, t21;
    and and2_1 (w21, p_1, w1); // w21 = p1 * p0 * c0 = p1 * w1
    and and2_2 (w22, p_1, g_0); // w22 = p1 * g0
    or or2_1 (t21, w21, w22);
    or or2_2 (c_2, g_1, t21);

    wire c_3; // c3 = g2 + p2 * g1 + p2 * p1 * g0 + p2 * p1 * p0 * c0
    wire w31, w32, w33, t31, t32;
    and and3_1 (w31, p_2, w21); // w31 = p2 * p1 * p0 * c0 = p2 * w21
    and and3_2 (w32, p_2, w22); // w32 = p2 * p1 * g0 = p2 * w22
    and and3_3 (w33, p_2, g_1); // w33 = p2 * g1
    or or3_1 (t31, w31, w32);
    or or3_2 (t32, w33, t31);
    or or3_3 (c_3, g_2, t32);

    wire c_4; // c4 = g3 + p3 * g2 + p3 * p2 * g1 + p3 * p2 * p1 * g0 + p3 * p2 * p1 * p0 * c0
    wire w41, w42, w43, w44, t41, t42, t43;
    and and4_1 (w41, p_3, w31); // w41 = p3 * p2 * p1 * p0 * c0 = p3 * w31
    and and4_2 (w42, p_3, w32); // w42 = p3 * p2 * p1 * g0 = p3 * w32
    and and4_3 (w43, p_3, w33); // w43 = p3 * p2 * g1 = p3 * w33
    and and4_4 (w44, p_3, g_2); // w44 = p3 * g2
    or or4_1 (t41, w41, w42);
    or or4_2 (t42, w43, t41);
    or or4_3 (t43, w44, t42);
    or or4_4 (c_4, g_3, t43);

    wire c_5; // c5 = g4 + p4 * g3 + p4 * p3 * g2 + p4 * p3 * p2 * g1 + p4 * p3 * p2 * p1 * g0 + p4 * p3 * p2 * p1 * p0 * c0
    wire w51, w52, w53, w54, w55, t51, t52, t53, t54;
    and and5_1 (w51, p_4, w41); // w51 = p4 * p3 * p2 * p1 * p0 * c0 = p4 * w41
    and and5_2 (w52, p_4, w42); // w52 = p4 * p3 * p2 * p1 * g0 = p4 * w42
    and and5_3 (w53, p_4, w43); // w53 = p4 * p3 * p2 * g1 = p4 * w43
    and and5_4 (w54, p_4, w44); // w54 = p4 * p3 * g2 = p4 * w44
    and and5_5 (w55, p_4, g_3); // w55 = p4 * g3
    or or5_1 (t51, w51, w52);
    or or5_2 (t52, w53, t51);
    or or5_3 (t53, w54, t52);
    or or5_4 (t54, w55, t53);
    or or5_5 (c_5, g_4, t54);

    wire c_6; // c6 = g5 + p5 * g4 + p5 * p4 * g3 + p5 * p4 * p3 * g2 + p5 * p4 * p3 * p2 * g1 + p5 * p4 * p3 * p2 * p1 * g0 + p5 * p4 * p3 * p2 * p1 * p0 * c0
    wire w61, w62, w63, w64, w65, w66, t61, t62, t63, t64, t65;
    and and6_1 (w61, p_5, w51); // w61 = p5 * p4 * p3 * p2 * p1 * p0 * c0 = p5 * w51
    and and6_2 (w62, p_5, w52); // w62 = p5 * p4 * p3 * p2 * p1 * g0 = p5 * w52
    and and6_3 (w63, p_5, w53); // w63 = p5 * p4 * p3 * p2 * g1 = p5 * w53
    and and6_4 (w64, p_5, w54); // w64 = p5 * p4 * p3 * g2 = p5 * w54
    and and6_5 (w65, p_5, w55); // w65 = p5 * p4 * g3 = p5 * w55
    and and6_6 (w66, p_5, g_4); // w66 = p5 * g4
    or or6_1 (t61, w61, w62);
    or or6_2 (t62, w63, t61);
    or or6_3 (t63, w64, t62);
    or or6_4 (t64, w65, t63);
    or or6_5 (t65, w66, t64);
    or or6_6 (c_6, g_5, t65);

    wire c_7; // c7 = g6 + p6 * g5 + p6 * p5 * g4 + p6 * p5 * p4 * g3 + p6 * p5 * p4 * p3 * g2 + p6 * p5 * p4 * p3 * p2 * g1 + p6 * p5 * p4 * p3 * p2 * p1 * g0 + p6 * p5 * p4 * p3 * p2 * p1 * p0 * c0
    wire w71, w72, w73, w74, w75, w76, w77, t71, t72, t73, t74, t75, t76;
    and and7_1 (w71, p_6, w61); // w71 = p6 * p5 * p4 * p3 * p2 * p1 * p0 * c0 = p6 * w61
    and and7_2 (w72, p_6, w62); // w72 = p6 * p5 * p4 * p3 * p2 * p1 * g0 = p6 * w62
    and and7_3 (w73, p_6, w63); // w73 = p6 * p5 * p4 * p3 * p2 * g1 = p6 * w63
    and and7_4 (w74, p_6, w64); // w74 = p6 * p5 * p4 * p3 * g2 = p6 * w64
    and and7_5 (w75, p_6, w65); // w75 = p6 * p5 * p4 * g3 = p6 * w65
    and and7_6 (w76, p_6, w66); // w76 = p6 * p5 * g4 = p6 * w66
    and and7_7 (w77, p_6, g_5); // w77 = p6 * g5
    or or7_1 (t71, w71, w72);
    or or7_2 (t72, w73, t71);
    or or7_3 (t73, w74, t72);
    or or7_4 (t74, w75, t73);
    or or7_5 (t75, w76, t74);
    or or7_6 (t76, w77, t75);
    or or7_7 (c_7, g_6, t76);

    // P
    
    wire ptemp1, ptemp2, ptemp3, ptemp4, ptemp5, ptemp6, ptemp7;
    and and_p1 (ptemp1, p_1, p_0);
    and and_p2 (ptemp2, p_2, ptemp1);
    and and_p3 (ptemp3, p_3, ptemp2);
    and and_p4 (ptemp4, p_4, ptemp3);
    and and_p5 (ptemp5, p_5, ptemp4);
    and and_p6 (ptemp6, p_6, ptemp5);
    and and_p7 (P, p_7, ptemp6);

    // G

    wire gand1, gand2, gand3, gand4, gand5, gand6, gand7;
    wire intermediate1, intermediate2, intermediate3, intermediate4, intermediate5, intermediate6;
    and and_g1 (gand1, p_7, g_6); // gand1 = p7 * p6
    and and_g2_1 (intermediate1, p_7, p_6);
    and and_g2_2 (gand2, g_5, intermediate1); // gand2 = p7 * p6 * g5
    and and_g3_1 (intermediate2, p_5, intermediate1);
    and and_g3_2 (gand3, g_4, intermediate2); // gand3 = p7 * p6 * p5 * g4
    and and_g4_1 (intermediate3, p_4, intermediate2);
    and and_g4_2 (gand4, g_3, intermediate3); // gand4 = p7 * p6 * p5 * p4 * g3
    and and_g5_1 (intermediate4, p_3, intermediate3);
    and and_g5_2 (gand5, g_2, intermediate4); // gand5 = p7 * p6 * p5 * p4 * p3 * g2
    and and_g6_1 (intermediate5, p_2, intermediate4);
    and and_g6_2 (gand6, g_1, intermediate5); // gand6 = p7 * p6 * p5 * p4 * p3 * p2 * g1
    and and_g7_1 (intermediate6, p_1, intermediate5);
    and and_g7_2 (gand7, g_0, intermediate6); // gand7 = p7 * p6 * p5 * p4 * p3 * p2 * p1 * g0

    wire gor1, gor2, gor3, gor4, gor5, gor6, gor7;
    or or_g1 (gor1, gand1, g_7);
    or or_g2 (gor2, gand2, gor1);
    or or_g3 (gor3, gand3, gor2);
    or or_g4 (gor4, gand4, gor3);
    or or_g5 (gor5, gand5, gor4);
    or or_g6 (gor6, gand6, gor5);
    or or_g7 (G, gand7, gor6);

    // compute sum

    wire x_0, x_1, x_2, x_3, x_4, x_5, x_6, x_7;

    xor xor0_1 (x_0, A[0], B[0]);
    xor xor0_2 (sum[0], c_in, x_0);

    xor xor1_1 (x_1, A[1], B[1]);
    xor xor1_2 (sum[1], c_1, x_1);

    xor xor2_1 (x_2, A[2], B[2]);
    xor xor2_2 (sum[2], c_2, x_2);

    xor xor3_1 (x_3, A[3], B[3]);
    xor xor3_2 (sum[3], c_3, x_3);

    xor xor4_1 (x_4, A[4], B[4]);
    xor xor4_2 (sum[4], c_4, x_4);

    xor xor5_1 (x_5, A[5], B[5]);
    xor xor5_2 (sum[5], c_5, x_5);

    xor xor6_1 (x_6, A[6], B[6]);
    xor xor6_2 (sum[6], c_6, x_6);

    xor xor7_1 (x_7, A[7], B[7]);
    xor xor7_2 (sum[7], c_7, x_7);

endmodule

module mult_adder(data_operandA, data_operandB, c_0, data_result);

    input [31:0] data_operandA, data_operandB;
    input c_0;
    output [31:0] data_result;

    wire G_0, P_0, G_1, P_1, G_2, P_2, G_3, P_3;
    wire c_8, c_16, c_24, c_32;

    mult_adder_cla block_0 (data_operandA[7:0], data_operandB[7:0], c_0, data_result[7:0], G_0, P_0);

    // c8 = g0 + p0 * c0
    wire w0;
    and and8 (w0, P_0, c_0);
    or or8 (c_8, G_0, w0);

    mult_adder_cla block_1 (data_operandA[15:8], data_operandB[15:8], c_8, data_result[15:8], G_1, P_1);

    // c16 = g1 + p1 * g0 + p1 * p0 * c0
    wire w11, w12, t11;
    and and16_1 (w11, P_1, w0);
    and and16_2 (w12, P_1, G_0);
    or or16_1 (t11, w11, w12);
    or or16_2 (c_16, G_1, t11);

    mult_adder_cla block_2 (data_operandA[23:16], data_operandB[23:16], c_16, data_result[23:16], G_2, P_2);

    // c24 = g2 + p2 * g1 + p2 * p1 * g0 + p2 * p1 * p0 * c0
    wire w21, w22, w23, t21, t22;
    and and24_1 (w21, P_2, w11);
    and and24_2 (w22, P_2, w12);
    and and24_3 (w23, P_2, G_1);
    or or24_1 (t21, w21, w22);
    or or24_2 (t22, w23, t21);
    or or24_3 (c_24, G_2, t22);

    mult_adder_cla block_3 (data_operandA[31:24], data_operandB[31:24], c_24, data_result[31:24], G_3, P_3);

    // c32 = g3 + p3 * g2 + p3 * p2 * g1 + p3 * p2 * p1 * g0 + p3 * p2 * p1 * p0 * c0
    wire w31, w32, w33, w34, t31, t32, t33;
    wire c_out;
    and and32_1 (w31, P_3, w21);
    and and32_2 (w32, P_3, w22);
    and and32_3 (w33, P_3, w23);
    and and32_4 (w34, P_3, G_2);
    or or32_1 (t31, w31, w32);
    or or32_2 (t32, w33, t31);
    or or32_3 (t33, w34, t32);
    or or32_4 (c_out, G_3, t33);

endmodule