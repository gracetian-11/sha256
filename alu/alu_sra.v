module shift_right_1(data_operandA, data_result);

    input [31:0] data_operandA;
    output [31:0] data_result;

    assign data_result[0] = data_operandA[1];
    assign data_result[1] = data_operandA[2];
    assign data_result[2] = data_operandA[3];
    assign data_result[3] = data_operandA[4];
    assign data_result[4] = data_operandA[5];
    assign data_result[5] = data_operandA[6];
    assign data_result[6] = data_operandA[7];
    assign data_result[7] = data_operandA[8];
    assign data_result[8] = data_operandA[9];
    assign data_result[9] = data_operandA[10];
    assign data_result[10] = data_operandA[11];
    assign data_result[11] = data_operandA[12];
    assign data_result[12] = data_operandA[13];
    assign data_result[13] = data_operandA[14];
    assign data_result[14] = data_operandA[15];
    assign data_result[15] = data_operandA[16];
    assign data_result[16] = data_operandA[17];
    assign data_result[17] = data_operandA[18];
    assign data_result[18] = data_operandA[19];
    assign data_result[19] = data_operandA[20];
    assign data_result[20] = data_operandA[21];
    assign data_result[21] = data_operandA[22];
    assign data_result[22] = data_operandA[23];
    assign data_result[23] = data_operandA[24];
    assign data_result[24] = data_operandA[25];
    assign data_result[25] = data_operandA[26];
    assign data_result[26] = data_operandA[27];
    assign data_result[27] = data_operandA[28];
    assign data_result[28] = data_operandA[29];
    assign data_result[29] = data_operandA[30];
    assign data_result[30] = data_operandA[31];
    assign data_result[31] = data_operandA[31];

endmodule

module shift_right_2(data_operandA, data_result);
    
    input [31:0] data_operandA;
    output [31:0] data_result;

    wire [31:0] intermediate;
    shift_right_1 first (data_operandA, intermediate);
    shift_right_1 second (intermediate, data_result);

endmodule

module shift_right_4(data_operandA, data_result);
    
    input [31:0] data_operandA;
    output [31:0] data_result;

    wire [31:0] intermediate;
    shift_right_2 first (data_operandA, intermediate);
    shift_right_2 second (intermediate, data_result);

endmodule

module shift_right_8(data_operandA, data_result);
    
    input [31:0] data_operandA;
    output [31:0] data_result;

    wire [31:0] intermediate;
    shift_right_4 first (data_operandA, intermediate);
    shift_right_4 second (intermediate, data_result);

endmodule

module shift_right_16(data_operandA, data_result);
    
    input [31:0] data_operandA;
    output [31:0] data_result;

    wire [31:0] intermediate;
    shift_right_8 first (data_operandA, intermediate);
    shift_right_8 second (intermediate, data_result);

endmodule

module alu_sra(data_operandA, ctrl_shiftamt, data_result);

    input [31:0] data_operandA;
    input [4:0] ctrl_shiftamt;
    output [31:0] data_result;

    wire [31:0] wire1, wire2, wire4, wire8, wire16;
    wire [31:0] result1, result2, result3, result4;

    shift_right_16 s16 (data_operandA, wire16);
    mux_2 m16 (result4, ctrl_shiftamt[4], data_operandA, wire16);

    shift_right_8 s8 (result4, wire8);
    mux_2 m8 (result3, ctrl_shiftamt[3], result4, wire8);
    
    shift_right_4 s4 (result3, wire4);
    mux_2 m4 (result2, ctrl_shiftamt[2], result3, wire4);

    shift_right_2 s2 (result2, wire2);
    mux_2 m2 (result1, ctrl_shiftamt[1], result2, wire2);

    shift_right_1 s1 (result1, wire1);
    mux_2 m1 (data_result, ctrl_shiftamt[0], result1, wire1);

endmodule