module majority(data_operandA, data_operandB, data_operandC, maj);

    input [31:0] data_operandA, data_operandB, data_operandC;
    output [31:0] maj;

    // maj = (a and b) xor (a and c) xor (b and c)
    assign maj = (data_operandA & data_operandB) ^ (data_operandA & data_operandC) ^ (data_operandB & data_operandC);
	
endmodule