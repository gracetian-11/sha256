module alu(data_operandA, data_operandB, ctrl_ALUopcode,
			ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

	input [31:0] data_operandA, data_operandB;
	input [4:0] ctrl_ALUopcode, ctrl_shiftamt;
	output [31:0] data_result;
	output isNotEqual, isLessThan, overflow;
	
	wire signed[31:0] inner_A, inner_B;
	reg signed[31:0] inner_result;
	reg inner_cout;
	
	assign inner_A = data_operandA;
	assign inner_B = data_operandB;
	
	assign isNotEqual = data_operandA != data_operandB;
	assign isLessThan = data_operandA < data_operandB;
	assign isOverflow = inner_cout != inner_result[31];
	assign overflow = (ctrl_ALUopcode == 5'b00000 || ctrl_ALUopcode == 5'b00001) ? isOverflow : 1'b0; 

	wire [31:0] rotr_result;
	right_rotate ROTR (inner_A, rotr_result, ctrl_shiftamt);

	assign data_result = (ctrl_ALUopcode == 5'b00111) ? rotr_result : inner_result;

	always @(ctrl_ALUopcode or inner_A or inner_B or ctrl_shiftamt)
		begin
			// Default state for other ctrl_ALUopcode states
			{inner_cout, inner_result} = inner_A + inner_B;
			case (ctrl_ALUopcode)
				0 : {inner_cout, inner_result} = inner_A + inner_B; // ADD
				1 : {inner_cout, inner_result} = inner_A - inner_B;	// SUBTRACT
				2 : inner_result = inner_A & inner_B;  			    // AND
				3 : inner_result = inner_A | inner_B;  			    // OR
				4 : inner_result = inner_A << ctrl_shiftamt;		// SLL
				5 : inner_result = inner_A >>> ctrl_shiftamt;	    // SRA
				6 : inner_result = inner_A ^ inner_B;               // XOR
				7 : inner_result = rotr_result;                     // ROTR
			endcase
		end
	
endmodule