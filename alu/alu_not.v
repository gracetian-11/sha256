module alu_not(data_operandA, data_result);
        
    input [31:0] data_operandA;
    output [31:0] data_result;
    
    not not0(data_result[0], data_operandA[0]);
    not not1(data_result[1], data_operandA[1]);
    not not2(data_result[2], data_operandA[2]);
    not not3(data_result[3], data_operandA[3]);
    not not4(data_result[4], data_operandA[4]);
    not not5(data_result[5], data_operandA[5]);
    not not6(data_result[6], data_operandA[6]);
    not not7(data_result[7], data_operandA[7]);
    not not8(data_result[8], data_operandA[8]);
    not not9(data_result[9], data_operandA[9]);
    not not10(data_result[10], data_operandA[10]);
    not not11(data_result[11], data_operandA[11]);
    not not12(data_result[12], data_operandA[12]);
    not not13(data_result[13], data_operandA[13]);
    not not14(data_result[14], data_operandA[14]);
    not not15(data_result[15], data_operandA[15]);
    not not16(data_result[16], data_operandA[16]);
    not not17(data_result[17], data_operandA[17]);
    not not18(data_result[18], data_operandA[18]);
    not not19(data_result[19], data_operandA[19]);
    not not20(data_result[20], data_operandA[20]);
    not not21(data_result[21], data_operandA[21]);
    not not22(data_result[22], data_operandA[22]);
    not not23(data_result[23], data_operandA[23]);
    not not24(data_result[24], data_operandA[24]);
    not not25(data_result[25], data_operandA[25]);
    not not26(data_result[26], data_operandA[26]);
    not not27(data_result[27], data_operandA[27]);
    not not28(data_result[28], data_operandA[28]);
    not not29(data_result[29], data_operandA[29]);
    not not30(data_result[30], data_operandA[30]);
    not not31(data_result[31], data_operandA[31]);

endmodule