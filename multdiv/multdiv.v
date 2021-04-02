module multdiv(
	data_operandA, data_operandB, 
	ctrl_MULT, ctrl_DIV, 
	clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, ctrl_DIV, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;

    wire mult_op;
    dffe_ref mult_operation (mult_op, ctrl_MULT, clock, ctrl_MULT, ctrl_DIV);

    // MULTIPLICATION: Modified Boothe's Algorithm
    wire [31:0] mult_data_result;
    wire mult_data_exception, mult_data_resultRDY;
    mult multiplication (data_operandA, data_operandB, ctrl_MULT, clock, mult_data_result, mult_data_exception, mult_data_resultRDY);

    // DIVISION: Non-Restoring Division
    wire [31:0] div_data_result;
    wire div_data_exception, div_data_resultRDY;
    wire [31:0] op_A, op_B, neg_A, neg_B;
    wire [31:0] div_result;
    wire one_negative;
    xor one (one_negative, data_operandA[31], data_operandB[31]);    
    negate negative_A (data_operandA, neg_A); // if either of the operands is negative, negate that operand
    negate negative_B (data_operandB, neg_B);
    assign op_A = data_operandA[31] ? neg_A : data_operandA;
    assign op_B = data_operandB[31] ? neg_B : data_operandB;
    div division (op_A, op_B, ctrl_DIV, clock, div_result, div_data_exception, div_data_resultRDY);
    wire [31:0] neg_div_result; // if either of the operands is negative, negate the result
    negate negative_result (div_result, neg_div_result);
    assign div_data_result = one_negative ? neg_div_result : div_result;
    
    assign data_result = mult_op ? mult_data_result : div_data_result;
    assign data_exception = mult_op ? mult_data_exception : div_data_exception;

    wire multdiv_start;
    assign multdiv_start = ctrl_DIV || ctrl_MULT;
    wire data_resultRDY_if_start;
    assign data_resultRDY_if_start = multdiv_start ? 1'b0 : div_data_resultRDY;
    assign data_resultRDY = mult_op ? mult_data_resultRDY : data_resultRDY_if_start;

endmodule