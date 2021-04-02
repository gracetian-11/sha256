module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;

    wire [31:0] not_B;
    alu_not notB (data_operandB, not_B);

    wire [31:0] add_result, B;
    mux_2 add_or_sub (B, ctrl_ALUopcode[0], data_operandB, not_B);
    alu_adder add_AB (data_operandA, B, ctrl_ALUopcode[0], add_result);

    wire [31:0] and_result;
    alu_and and_AB (data_operandA, data_operandB, and_result);

    wire [31:0] or_result;
    alu_or or_AB (data_operandA, data_operandB, or_result);

    wire [31:0] sll_result;
    alu_sll sll_A (data_operandA, ctrl_shiftamt, sll_result);

    wire [31:0] sra_result;
    alu_sra sra_A (data_operandA, ctrl_shiftamt, sra_result);

    // less than
    // case 1: overflow = 0 and add_result[31] = 1
    // case 2: overflow = 1 and data_operandA[31] 1
    wire not_overflow, ltcase_1, ltcase_2;
    not not_o (not_overflow, overflow);
    and lt_case1 (ltcase_1, not_overflow, add_result[31]);
    and lt_case2 (ltcase_2, overflow, data_operandA[31]);
    or less_than (isLessThan, ltcase_1, ltcase_2);

    // is not equal
    not_eq is_eq (isNotEqual, add_result);

    // overflow
    wire not_A_31, not_B_31, not_add_result_31;
    not notA31 (not_A_31, data_operandA[31]);
    not notB31 (not_B_31, data_operandB[31]);
    not notAdd31 (not_add_result_31, add_result[31]);
    // overflow -- addition!
    // case 1: data_operandA[31] = 0 and data_operandB[31] = 0 and add_result[31] = 1;
    // case 2: data_operandA[31] = 1 and data_operandB[31] = 1 and add_result[31] = 0;
    wire of_add, of_add_case_1, of_add_case_2;
    and of_add_case1 (of_add_case_1, not_A_31, not_B_31, add_result[31]);
    and of_addcase2 (of_add_case_2, data_operandA[31], data_operandB[31], not_add_result_31);
    or of_a (of_add, of_add_case_1, of_add_case_2);
    // overflow -- subtraction!
    // case 1: data_operandA[31] = 0 and data_operandB[31] = 1 and add_result[31] = 1;
    // case 2: data_operandA[31] = 1 and data_operandB[31] = 0 and add_result[31] = 0;
    wire of_sub, of_sub_case_1, of_sub_case_2;
    and of_sub_case1 (of_sub_case_1, not_A_31, data_operandB[31], add_result[31]);
    and of_sub_case2 (of_sub_case_2, data_operandA[31], not_B_31, not_add_result_31);
    or of_s (of_sub, of_sub_case_1, of_sub_case_2);
    // overflow
    mux_2_one_bit of (overflow, ctrl_ALUopcode[0], of_add, of_sub);

    mux_8 control (data_result, ctrl_ALUopcode[2:0], add_result, add_result, and_result, or_result, sll_result, sra_result, 0, 0);

endmodule