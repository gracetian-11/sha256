module div(
	data_operandA, data_operandB, 
	ctrl_DIV, clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_DIV, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;

    wire [31:0] q, m;
    assign q = data_operandA; // dividend
    assign m = data_operandB; // divisor

    wire [31:0] in_a, curr_a; // remainder
    wire [31:0] in_q, curr_q; // quotient
    wire [31:0] in_n, out_n; // number of bits
    wire input_enable;
    assign input_enable = 1'b1;
    wire n_reset;

    register remainder_reg (clock, ctrl_DIV, input_enable, in_a, curr_a);
    register quotient_reg (clock, ctrl_DIV, input_enable, in_q, curr_q);
    register n_reg (clock, 1'b0, input_enable, in_n, out_n);

    // if divisor = 0 --> data_exception = 1
    nor check_divisor_zero (data_exception, m[0], m[1], m[2], m[3], m[4], m[5], m[6], m[7], m[8], m[9], m[10], m[11], m[12], m[13], m[14], m[15], m[16], m[17], m[18], m[19], m[20], m[21], m[22], m[23], m[24], m[25], m[26], m[27], m[28], m[29], m[30], m[31]);

    // if n = 32 --> first = 1
    // on the first cycle, n = 32
    wire first;
    assign first = out_n == 32'b00000000000000000000000000100000;

    // if n = -1 --> data_resultRDY = 1
    // on the last cycle, n = -1
    assign data_resultRDY = out_n == 32'b11111111111111111111111111111111;

    // shift AQ << 1
    wire [31:0] shift_result_a, shift_result_q;
    assign shift_result_q = curr_q << 1;
    assign shift_result_a[31:1] = curr_a[30:0];
    assign shift_result_a[0] = curr_q[31];
    
    // if curr_a[31] == 0 --> A = A - m
    // if curr_a[31] == 1 --> A = A + m
    wire [31:0] result_a, neg_m, add_op_b;
    wire c_in;
    assign c_in = curr_a[31] ? 1'b0 : 1'b1;
    assign neg_m = ~m;
    assign add_op_b = curr_a[31] ? m : neg_m; 

    // update remainder
    mult_adder add (shift_result_a, add_op_b, c_in, result_a);
    assign in_a = first ? 32'b00000000000000000000000000000000 : result_a;

    // if result_a[31] == 0 --> q[0] = 1
    // if result_a[31] == 1 --> q[0] = 0
    wire [31:0] result_q;
    wire q_0;
    assign q_0 = result_a[31] ? 1'b0 : 1'b1;
    assign result_q[31:1] = shift_result_q[31:1];
    assign result_q[0] = q_0;

    // update quotient
    assign in_q = first ? q : result_q;

    // calculations for final remainder
    wire [31:0] final_add_op, final_a;
    assign final_add_op = in_a[31] ? m : 32'b00000000000000000000000000000000;
    wire final_add_c_in;
    assign final_add_c_in = 1'b0;
    mult_adder final_add (in_a, final_add_op, final_add_c_in, final_a);

    // update n
    wire [31:0] neg_one, updated_n;
    assign neg_one = 32'b11111111111111111111111111111111;
    wire n_c_in;
    assign n_c_in = 1'b0;
    mult_adder update_n (out_n, neg_one, n_c_in, updated_n);
    // if ctrl_DIV = 1 --> n is reset to 32
    assign in_n = ctrl_DIV ? 32'b00000000000000000000000000100000 : updated_n;

    // if data_exception = 1 --> data_result = 0
    assign data_result = data_exception ? 32'b00000000000000000000000000000000 : curr_q;

endmodule