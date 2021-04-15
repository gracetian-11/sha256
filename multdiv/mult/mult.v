module mult(
	data_operandA, data_operandB, 
	ctrl_MULT, clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;

    wire [31:0] mc, mp;
    assign mc = data_operandA; // multiplicand
    assign mp = data_operandB; // multiplier

    wire [31:0] curr_product_left, curr_product_right, input_product_left, input_product_right;
    wire input_helper, output_helper;
    wire ctrl_reset, input_enable;
    assign input_enable = 1'b1;
    
    register product_left_reg (clock, ctrl_MULT, input_enable, input_product_left, curr_product_left);
    register product_right_reg (clock, ctrl_MULT, input_enable, input_product_right, curr_product_right);
    dffe_ref helper_reg (output_helper, input_helper, clock, input_enable, ctrl_MULT);

    wire [31:0] control_out;
    wire [4:0] counter;
    wire first;

    // clock counter to track cycle number
    clock_counter count (clock, ctrl_MULT, counter);

    // use select bits in curr_product_right to determine what to add or subtract to upper 32 bits of product
    // output control signals data_resultRDY and first
    mult_control control_unit (counter, mc, mp, curr_product_right, output_helper, data_resultRDY, first, control_out);

    wire [31:0] result_left;
    wire c_in;
    assign c_in = 1'b0;
    // add to upper 32 bits of product
    mult_adder add (curr_product_left, control_out, c_in, result_left);
    
    // shift product
    wire [31:0] result_right, result_shift_left;
    shift_product shift (result_left, curr_product_right, input_helper, result_shift_left, result_right);

    // update registers
    assign input_product_left = first ? curr_product_left : result_shift_left;
    assign input_product_right = first ? mp : result_right;

    // check for any exceptions
    mult_exception is_exception (mc, mp, curr_product_left, curr_product_right, data_exception);
    
    assign data_result = data_exception ? 32'b00000000000000000000000000000000 : curr_product_right;

endmodule