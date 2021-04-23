`timescale 1ns / 1ps
/**
 * 
 * READ THIS DESCRIPTION:
 *
 * This is the Wrapper module that will serve as the header file combining your processor, 
 * RegFile and Memory elements together.
 *
 * This file will be used to generate the bitstream to upload to the FPGA.
 * We have provided a sibling file, Wrapper_tb.v so that you can test your processor's functionality.
 * 
 * We will be using our own separate Wrapper_tb.v to test your code. You are allowed to make changes to the Wrapper files 
 * for your own individual testing, but we expect your final processor.v and memory modules to work with the 
 * provided Wrapper interface.
 * 
 * Refer to Lab 5 documents for detailed instructions on how to interface 
 * with the memory elements. Each imem and dmem modules will take 12-bit 
 * addresses and will allow for storing of 32-bit values at each address. 
 * Each memory module should receive a single clock. At which edges, is 
 * purely a design choice (and thereby up to you). 
 * 
 * You must change line 36 to add the memory file of the test you created using the assembler
 * For example, you would add sample inside of the quotes on line 38 after assembling sample.s
 *
 **/

module Wrapper (clock, reset, // assign clock to port E3 and reset to a button (I have P18) on FPGA
// these outputs go into the fpga board
				 A, // port T10
				 B, // port R10
				 C, // port K16
				 D, // port K13
				 E, // port P15
				 F, // port T11
				 G, // port L18
				 an0, // port J17
				 an1, // port J18
				 an2, // port T9
				 an3, // port J14
				 an4, // port P14
				 an5, // port T14
				 an6, // port K2
				 an7, // port U13
				 done_LED); // the done_LED signal just needs to be assigned to some arbitrary LED on the FPGA
	input clock, reset;

	output A; // port T10
	output B; // port R10
	output C; // port K16
	output D; // port K13
	output E; // port P15
	output F; // port T11
	output G; // port L18
	output an0; // port J17
	output an1; // port J18
	output an2; // port T9
	output an3; // port J14
	output an4; // port P14
	output an5; // port T14
	output an6; // port K2
	output an7; // port U13
	output done_LED;

	wire rwe, mwe;
	wire[4:0] rd, rs1, rs2;
	wire[31:0] instAddr, instData, 
		rData, regA, regB,
		memAddr, memDataIn, memDataOut;


	// ADD YOUR MEMORY FILE HERE
	localparam INSTR_FILE = "test_helloworld";
	
	// Main Processing Unit
	processor CPU(.clock(clock), .reset(reset), 
								
		// ROM
		.address_imem(instAddr), .q_imem(instData),
									
		// Regfile
		.ctrl_writeEnable(rwe),     .ctrl_writeReg(rd),
		.ctrl_readRegA(rs1),     .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB),
									
		// RAM
		.wren(mwe), .address_dmem(memAddr), 
		.data(memDataIn), .q_dmem(memDataOut)); 
	
	// Instruction Memory (ROM)
	ROM #(.MEMFILE({INSTR_FILE, ".mem"}))
	InstMem(.clk(clock), 
		.addr(instAddr[11:0]), 
		.dataOut(instData));
	
	// Register File
	regfile RegisterFile(.clock(clock), 
		.ctrl_writeEnable(rwe), .ctrl_reset(reset), 
		.ctrl_writeReg(rd),
		.ctrl_readRegA(rs1), .ctrl_readRegB(rs2), 
		.data_writeReg(rData), .data_readRegA(regA), .data_readRegB(regB));
						
	// Processor Memory (RAM)
	RAM ProcMem(.clk(clock), 
		.wEn(mwe), 
		.addr(memAddr[11:0]), 
		.dataIn(memDataIn), 
		.dataOut(memDataOut));

	// display to 7-segment unit
	// the "finished" port is an input port - put the signal which specifies if the CPU is finished hashing here
	// the "hash_value" port is an input port - put the hash result from the CPU here
	display_FPGA dipslay(.finished(), .clock(clock), .reset(reset), .hash_value(), 
					.A(A), .B(B), .C(C), .D(D), .E(E), .F(F), .G(G), 
					.an0(an0), .an1(an1), .an2(an2), .an3(an3), .an4(an4), .an5(an5), .an6(an6), .an7(an7), 
					.done_LED(done_LED));

endmodule
