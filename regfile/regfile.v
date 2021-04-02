module regfile (
	clock,
	ctrl_writeEnable, ctrl_reset, ctrl_writeReg,
	ctrl_readRegA, ctrl_readRegB, data_writeReg,
	data_readRegA, data_readRegB
);

	input clock, ctrl_writeEnable, ctrl_reset;
	input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	input [31:0] data_writeReg;

	output [31:0] data_readRegA, data_readRegB;

	// INPUT_ENABLES TO REGISTERS

	wire [31:0] reg_in_enable;
	wire reg0_in_enable, reg1_in_enable, reg2_in_enable, reg3_in_enable, reg4_in_enable, reg5_in_enable, reg6_in_enable, reg7_in_enable, reg8_in_enable, reg9_in_enable, reg10_in_enable, reg11_in_enable, reg12_in_enable, reg13_in_enable, reg14_in_enable, reg15_in_enable, reg16_in_enable, reg17_in_enable, reg18_in_enable, reg19_in_enable, reg20_in_enable, reg21_in_enable, reg22_in_enable, reg23_in_enable, reg24_in_enable, reg25_in_enable, reg26_in_enable, reg27_in_enable, reg28_in_enable, reg29_in_enable, reg30_in_enable, reg31_in_enable;
	decoder decode_writeReg (reg_in_enable, ctrl_writeReg, ctrl_writeEnable);
	and and0(reg0_in_enable, ctrl_writeEnable, reg_in_enable[0]);
	and and1(reg1_in_enable, ctrl_writeEnable, reg_in_enable[1]);
	and and2(reg2_in_enable, ctrl_writeEnable, reg_in_enable[2]);
	and and3(reg3_in_enable, ctrl_writeEnable, reg_in_enable[3]);
	and and4(reg4_in_enable, ctrl_writeEnable, reg_in_enable[4]);
	and and5(reg5_in_enable, ctrl_writeEnable, reg_in_enable[5]);
	and and6(reg6_in_enable, ctrl_writeEnable, reg_in_enable[6]);
	and and7(reg7_in_enable, ctrl_writeEnable, reg_in_enable[7]);
	and and8(reg8_in_enable, ctrl_writeEnable, reg_in_enable[8]);
	and and9(reg9_in_enable, ctrl_writeEnable, reg_in_enable[9]);
	and and10(reg10_in_enable, ctrl_writeEnable, reg_in_enable[10]);
	and and11(reg11_in_enable, ctrl_writeEnable, reg_in_enable[11]);
	and and12(reg12_in_enable, ctrl_writeEnable, reg_in_enable[12]);
	and and13(reg13_in_enable, ctrl_writeEnable, reg_in_enable[13]);
	and and14(reg14_in_enable, ctrl_writeEnable, reg_in_enable[14]);
	and and15(reg15_in_enable, ctrl_writeEnable, reg_in_enable[15]);
	and and16(reg16_in_enable, ctrl_writeEnable, reg_in_enable[16]);
	and and17(reg17_in_enable, ctrl_writeEnable, reg_in_enable[17]);
	and and18(reg18_in_enable, ctrl_writeEnable, reg_in_enable[18]);
	and and19(reg19_in_enable, ctrl_writeEnable, reg_in_enable[19]);
	and and20(reg20_in_enable, ctrl_writeEnable, reg_in_enable[20]);
	and and21(reg21_in_enable, ctrl_writeEnable, reg_in_enable[21]);
	and and22(reg22_in_enable, ctrl_writeEnable, reg_in_enable[22]);
	and and23(reg23_in_enable, ctrl_writeEnable, reg_in_enable[23]);
	and and24(reg24_in_enable, ctrl_writeEnable, reg_in_enable[24]);
	and and25(reg25_in_enable, ctrl_writeEnable, reg_in_enable[25]);
	and and26(reg26_in_enable, ctrl_writeEnable, reg_in_enable[26]);
	and and27(reg27_in_enable, ctrl_writeEnable, reg_in_enable[27]);
	and and28(reg28_in_enable, ctrl_writeEnable, reg_in_enable[28]);
	and and29(reg29_in_enable, ctrl_writeEnable, reg_in_enable[29]);
	and and30(reg30_in_enable, ctrl_writeEnable, reg_in_enable[30]);
	and and31(reg31_in_enable, ctrl_writeEnable, reg_in_enable[31]);	

	// REGISTERS
	wire reg_clock;
	assign reg_clock = !clock;

	wire [31:0] reg0_result, reg1_result, reg2_result, reg3_result, reg4_result, reg5_result, reg6_result, reg7_result, reg8_result, reg9_result, reg10_result, reg11_result, reg12_result, reg13_result, reg14_result, reg15_result, reg16_result, reg17_result, reg18_result, reg19_result, reg20_result, reg21_result, reg22_result, reg23_result, reg24_result, reg25_result, reg26_result, reg27_result, reg28_result, reg29_result, reg30_result, reg31_result;
	register reg0(reg_clock, ctrl_reset, 1'b0, data_writeReg, reg0_result);
	register reg1(reg_clock, ctrl_reset, reg1_in_enable, data_writeReg, reg1_result);
	register reg2(reg_clock, ctrl_reset, reg2_in_enable, data_writeReg, reg2_result);
	register reg3(reg_clock, ctrl_reset, reg3_in_enable, data_writeReg, reg3_result);
	register reg4(reg_clock, ctrl_reset, reg4_in_enable, data_writeReg, reg4_result);
	register reg5(reg_clock, ctrl_reset, reg5_in_enable, data_writeReg, reg5_result);
	register reg6(reg_clock, ctrl_reset, reg6_in_enable, data_writeReg, reg6_result);
	register reg7(reg_clock, ctrl_reset, reg7_in_enable, data_writeReg, reg7_result);
	register reg8(reg_clock, ctrl_reset, reg8_in_enable, data_writeReg, reg8_result);
	register reg9(reg_clock, ctrl_reset, reg9_in_enable, data_writeReg, reg9_result);
	register reg10(reg_clock, ctrl_reset, reg10_in_enable, data_writeReg, reg10_result);
	register reg11(reg_clock, ctrl_reset, reg11_in_enable, data_writeReg, reg11_result);
	register reg12(reg_clock, ctrl_reset, reg12_in_enable, data_writeReg, reg12_result);
	register reg13(reg_clock, ctrl_reset, reg13_in_enable, data_writeReg, reg13_result);
	register reg14(reg_clock, ctrl_reset, reg14_in_enable, data_writeReg, reg14_result);
	register reg15(reg_clock, ctrl_reset, reg15_in_enable, data_writeReg, reg15_result);
	register reg16(reg_clock, ctrl_reset, reg16_in_enable, data_writeReg, reg16_result);
	register reg17(reg_clock, ctrl_reset, reg17_in_enable, data_writeReg, reg17_result);
	register reg18(reg_clock, ctrl_reset, reg18_in_enable, data_writeReg, reg18_result);
	register reg19(reg_clock, ctrl_reset, reg19_in_enable, data_writeReg, reg19_result);
	register reg20(reg_clock, ctrl_reset, reg20_in_enable, data_writeReg, reg20_result);
	register reg21(reg_clock, ctrl_reset, reg21_in_enable, data_writeReg, reg21_result);
	register reg22(reg_clock, ctrl_reset, reg22_in_enable, data_writeReg, reg22_result);
	register reg23(reg_clock, ctrl_reset, reg23_in_enable, data_writeReg, reg23_result);
	register reg24(reg_clock, ctrl_reset, reg24_in_enable, data_writeReg, reg24_result);
	register reg25(reg_clock, ctrl_reset, reg25_in_enable, data_writeReg, reg25_result);
	register reg26(reg_clock, ctrl_reset, reg26_in_enable, data_writeReg, reg26_result);
	register reg27(reg_clock, ctrl_reset, reg27_in_enable, data_writeReg, reg27_result);
	register reg28(reg_clock, ctrl_reset, reg28_in_enable, data_writeReg, reg28_result);
	register reg29(reg_clock, ctrl_reset, reg29_in_enable, data_writeReg, reg29_result);
	register reg30(reg_clock, ctrl_reset, reg30_in_enable, data_writeReg, reg30_result);
	register reg31(reg_clock, ctrl_reset, reg31_in_enable, data_writeReg, reg31_result);

	// READ REG A

	wire [31:0] decodeA;
	decoder decode_A (decodeA, ctrl_readRegA, 1'b1);
	assign data_readRegA = decodeA[0] ? reg0_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[1] ? reg1_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[2] ? reg2_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[3] ? reg3_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[4] ? reg4_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[5] ? reg5_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[6] ? reg6_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[7] ? reg7_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[8] ? reg8_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[9] ? reg9_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[10] ? reg10_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[11] ? reg11_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[12] ? reg12_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[13] ? reg13_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[14] ? reg14_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[15] ? reg15_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[16] ? reg16_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[17] ? reg17_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[18] ? reg18_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[19] ? reg19_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[20] ? reg20_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[21] ? reg21_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[22] ? reg22_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[23] ? reg23_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[24] ? reg24_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[25] ? reg25_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[26] ? reg26_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[27] ? reg27_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[28] ? reg28_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[29] ? reg29_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[30] ? reg30_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegA = decodeA[31] ? reg31_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;

	// READ REG B
	
	wire [31:0] decodeB;
	decoder decode_B (decodeB, ctrl_readRegB, 1'b1);
	assign data_readRegB = decodeB[0] ? reg0_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[1] ? reg1_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[2] ? reg2_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[3] ? reg3_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[4] ? reg4_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[5] ? reg5_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[6] ? reg6_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[7] ? reg7_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[8] ? reg8_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[9] ? reg9_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[10] ? reg10_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[11] ? reg11_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[12] ? reg12_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[13] ? reg13_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[14] ? reg14_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[15] ? reg15_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[16] ? reg16_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[17] ? reg17_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[18] ? reg18_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[19] ? reg19_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[20] ? reg20_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[21] ? reg21_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[22] ? reg22_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[23] ? reg23_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[24] ? reg24_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[25] ? reg25_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[26] ? reg26_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[27] ? reg27_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[28] ? reg28_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[29] ? reg29_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[30] ? reg30_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;
	assign data_readRegB = decodeB[31] ? reg31_result : 32'bzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz;

endmodule
