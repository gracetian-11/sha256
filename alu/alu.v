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
	assign data_result = inner_result;
	
	assign isNotEqual = inner_A != inner_B;
	assign isLessThan = inner_A < inner_B;
	assign overflow = inner_cout != inner_result[31];

	wire [31:0] rotated_amt;
	right_rotate ROTR (data_operandA, rotated_amt, ctrl_shiftamt);
	
	always @(ctrl_ALUopcode or inner_A or inner_B or ctrl_shiftamt)
		begin
			// Default state for other ctrl_ALUopcode states
			{inner_cout, inner_result} = inner_A + inner_B;
			case (ctrl_ALUopcode)
				0 : {inner_cout, inner_result} = inner_A + inner_B; // ADD
				1 : {inner_cout, inner_result} = inner_A - inner_B;	// SUBTRACT
				2 : inner_result = inner_A & inner_B;  			    // AND
				3 : inner_result = inner_A ^ inner_B;  			    // XOR
				4 : inner_result = rotated_amt;		                // ROTR
				5 : inner_result = inner_A >>> ctrl_shiftamt;	    // SRA
			endcase
		end
	
endmodule