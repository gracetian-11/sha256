/**
 * READ THIS DESCRIPTION!
 *
 * This is your processor module that will contain the bulk of your code submission. You are to implement
 * a 5-stage pipelined processor in this module, accounting for hazards and implementing bypasses as
 * necessary.
 *
 * Ultimately, your processor will be tested by a master skeleton, so the
 * testbench can see which controls signal you active when. Therefore, there needs to be a way to
 * "inject" imem, dmem, and regfile interfaces from some external controller module. The skeleton
 * file, Wrapper.v, acts as a small wrapper around your processor for this purpose. Refer to Wrapper.v
 * for more details.
 *
 * As a result, this module will NOT contain the RegFile nor the memory modules. Study the inputs 
 * very carefully - the RegFile-related I/Os are merely signals to be sent to the RegFile instantiated
 * in your Wrapper module. This is the same for your memory elements. 
 *
 *
 */
module processor(
    // Control signals
    clock,                          // I: The master clock
    reset,                          // I: A reset signal

    // Imem
    address_imem,                   // O: The address of the data to get from imem
    q_imem,                         // I: The data from imem

    // Dmem
    address_dmem,                   // O: The address of the data to get or put from/to dmem
    data,                           // O: The data to write to dmem
    wren,                           // O: Write enable for dmem
    q_dmem,                         // I: The data from dmem

    // Regfile
    ctrl_writeEnable,               // O: Write enable for RegFile
    ctrl_writeReg,                  // O: Register to write to in RegFile
    ctrl_readRegA,                  // O: Register to read from port A of RegFile
    ctrl_readRegB,                  // O: Register to read from port B of RegFile
    data_writeReg,                  // O: Data to write to for RegFile
    data_readRegA,                  // I: Data from port A of RegFile
    data_readRegB                   // I: Data from port B of RegFile
	
	);

	// Control signals
	input clock, reset;
	
	// Imem
    output [31:0] address_imem;
	input [31:0] q_imem;

	// Dmem
	output [31:0] address_dmem, data;
	output wren;
	input [31:0] q_dmem;

	// Regfile
	output ctrl_writeEnable;
	output [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
	output [31:0] data_writeReg;
	input [31:0] data_readRegA, data_readRegB;

    // Output display
    output [255:0] hashOutput;
    output isHashDone;


    wire stall;
    wire input_enable;
    assign input_enable = 1'b1;
    wire [31:0] nop;
    assign nop = 32'b0;


    // PC LATCH
    wire [31:0] in_pc, out_pc;
    register pc (clock, reset, input_enable, in_pc, out_pc);
    
    // FD LATCH
    wire [31:0] fd_in_ir, fd_in_pc;
    wire [31:0] fd_out_ir, fd_out_pc;
    fd_latch fd (fd_in_ir, fd_in_pc, fd_out_ir, fd_out_pc, clock, reset, input_enable);

    // DX LATCH
    wire [31:0] dx_in_A, dx_in_B, dx_in_ir, dx_in_pc;
    wire [31:0] dx_out_A, dx_out_B, dx_out_ir, dx_out_pc;
    dx_latch dx (dx_in_A, dx_in_B, dx_in_ir, dx_in_pc, 
                 dx_out_A, dx_out_B, dx_out_ir, dx_out_pc,
                 clock, reset, input_enable);

    // XM LATCH
    wire [31:0] xm_in_O, xm_in_B, xm_in_ir;
    wire [31:0] xm_out_O, xm_out_B, xm_out_ir;
    xm_latch xm (xm_in_O, xm_in_B, xm_in_ir, 
                 xm_out_O, xm_out_B, xm_out_ir, 
                 clock, reset, input_enable);

    // MW LATCH
    wire [31:0] mw_in_O, mw_in_D, mw_in_ir;
    wire [31:0] mw_out_O, mw_out_D, mw_out_ir;
    mw_latch mw (mw_in_O, mw_in_D, mw_in_ir, 
                 mw_out_O, mw_out_D, mw_out_ir, 
                 clock, reset, input_enable);


    // DECODE STAGE INSTRUCTION
    wire [4:0] d_opcode, d_rd, d_rs, d_rt, d_shamt, d_ALUop;
    wire [31:0] d_imm;
    control decode_control(fd_out_ir, d_opcode, d_rd, d_rs, d_rt, d_shamt, d_ALUop, d_imm);

    // EXECUTE STAGE INSTRUCTION
    wire [4:0] x_opcode, x_rd, x_rs, x_rt, x_shamt, x_ALUop;
    wire [31:0] x_imm;
    control execute_control(dx_out_ir, x_opcode, x_rd, x_rs, x_rt, x_shamt, x_ALUop, x_imm);

    // MEMORY STAGE INSTRUCTION
    wire [4:0] m_opcode, m_rd, m_rs, m_rt, m_shamt, m_ALUop;
    wire [31:0] m_imm;
    control memory_control(xm_out_ir, m_opcode, m_rd, m_rs, m_rt, m_shamt, m_ALUop, m_imm);

    // WRITEBACK STAGE INSTRUCTION
    wire [4:0] w_opcode, w_rd, w_rs, w_rt, w_shamt, w_ALUop;
    wire [31:0] w_imm;
    control writeback_control(mw_out_ir, w_opcode, w_rd, w_rs, w_rt, w_shamt, w_ALUop, w_imm);


    // OUTPUT DISPLAY (memory)
    wire h_ctrl_reset, h_input_enable;
    assign h_ctrl_reset = reset;
    assign h_input_enable = 1'b1;
    wire [31:0] h0_in, h1_in, h2_in, h3_in, h4_in, h5_in, h6_in, h7_in;
    wire [31:0] h0_out, h1_out, h2_out, h3_out, h4_out, h5_out, h6_out, h7_out;
    register h_0 (clock, h_ctrl_reset, h_input_enable, h0_in, h0_out);
    register h_1 (clock, h_ctrl_reset, h_input_enable, h1_in, h1_out);
    register h_2 (clock, h_ctrl_reset, h_input_enable, h2_in, h2_out);
    register h_3 (clock, h_ctrl_reset, h_input_enable, h3_in, h3_out);
    register h_4 (clock, h_ctrl_reset, h_input_enable, h4_in, h4_out);
    register h_5 (clock, h_ctrl_reset, h_input_enable, h5_in, h5_out);
    register h_6 (clock, h_ctrl_reset, h_input_enable, h6_in, h6_out);
    register h_7 (clock, h_ctrl_reset, h_input_enable, h7_in, h7_out);
    // assign inputs to registers if swHash instruction (opcode = 5'b11110)
    assign h0_in = (m_opcode == 5'b11110 && m_rd == 5'b00000) ? q_dmem : h0_out;
    assign h1_in = (m_opcode == 5'b11110 && m_rd == 5'b00001) ? q_dmem : h1_out;
    assign h2_in = (m_opcode == 5'b11110 && m_rd == 5'b00010) ? q_dmem : h2_out;
    assign h3_in = (m_opcode == 5'b11110 && m_rd == 5'b00011) ? q_dmem : h3_out;
    assign h4_in = (m_opcode == 5'b11110 && m_rd == 5'b00100) ? q_dmem : h4_out;
    assign h5_in = (m_opcode == 5'b11110 && m_rd == 5'b00101) ? q_dmem : h5_out;
    assign h6_in = (m_opcode == 5'b11110 && m_rd == 5'b00110) ? q_dmem : h6_out;
    assign h7_in = (m_opcode == 5'b11110 && m_rd == 5'b00111) ? q_dmem : h7_out;
    // assign hashOutput
    assign hashOutput[31:0] = h7_out;
    assign hashOutput[63:32] = h6_out;
    assign hashOutput[95:64] = h5_out;
    assign hashOutput[127:96] = h4_out;
    assign hashOutput[159:128] = h3_out;
    assign hashOutput[191:160] = h2_out;
    assign hashOutput[223:192] = h1_out;
    assign hashOutput[255:224] = h0_out;
    // assign isHashDone = 1 if hashDone instruction (opcode = 5'b11111)
    assign isHashDone = (m_opcode == 5'b11111) ? 1'b1 : 1'b0;


    // FETCH
    wire [31:0] pc_select_1, pc_select_2;
    wire [31:0] new_pc;
    wire pc_jump;
    assign pc_jump = pc_branch || pc_imm || pc_rd;
    // PC: if (bne (00010) and isNotEqual = 1) or (blt (00110) and isLessThan = 1) --> PC = PC+1+imm
    //     if JI (10) and not setx (10101) --> PC = imm
    //     if JII (11) --> PC = rd
    //     else --> PC = PC+1
    assign pc_select_1 = pc_branch ? pc_plus_imm : pc_plus_1;
    assign pc_select_2 = pc_imm ? x_imm : pc_select_1;
    assign new_pc = pc_rd ? ALU_in_A : pc_select_2;
    assign in_pc = stall ? out_pc : new_pc;
    wire [31:0] pc_plus_1, new_pc_plus_1;
    wire [31:0] one;
    assign one = 32'b00000000000000000000000000000001;
    alu_adder pc_add_1 (out_pc, one, 1'b0, pc_plus_1);
    alu_adder new_pc_add_1 (new_pc, one, 1'b0, new_pc_plus_1);
    assign address_imem = in_pc;
    assign fd_in_pc = pc_jump ? new_pc_plus_1 : pc_plus_1;
    // fd_in_ir: if stall --> fd_in_ir = fd_out_ir
    //           if pc_jump --> fd_in_ir = nop
    //           else --> fd_in_ir = q_imem
    wire [31:0] fd_stall;
    assign fd_stall = stall ? fd_out_ir : q_imem;
    assign fd_in_ir = pc_jump ? nop : fd_stall;

    // DECODE
    assign ctrl_readRegA = d_rs;
    assign ctrl_readRegB = d_rt;
    assign dx_in_A = data_readRegA;
    assign dx_in_B = data_readRegB;
    assign dx_in_pc = fd_out_pc;
    // dx_in_ir: if stall or pc_jump --> dx_in_ir = nop
    //           else --> dx_in_ir = fd_out_ir;
    assign dx_in_ir = (stall || pc_jump) ? nop : fd_out_ir;

    // EXECUTE
    wire [31:0] ALU_in_A, ALU_in_B;
    // don't bypass from memory if m instruction = sw, bne, blt, jr
    // don't bypass from writeback if w instruction = sw, bne, blt, jr
    wire xm_no_bypass, mw_no_bypass;
    assign xm_no_bypass = (m_opcode == 5'b00111) || (m_opcode == 5'b00010) ||
                          (m_opcode == 5'b00110) || (m_opcode == 5'b00100);
    assign mw_no_bypass = (w_opcode == 5'b00111) || (w_opcode == 5'b00010) || 
                          (w_opcode == 5'b00110) || (w_opcode == 5'b00100);
    // ALU operand A
    // A: x_rs == m_rd --> A = xm_out_O
    //    x_rs == w_rd --> A = data_writeReg
    //    else --> A = dx_out_A
    wire [31:0] A_bypass_1, A_bypass_2;
    wire A_xm_bypass, A_mw_bypass, A_no_bypass;
    assign A_xm_bypass = x_rs == m_rd;
    assign A_mw_bypass = x_rs == w_rd;
    assign A_bypass_1 = (A_xm_bypass && ~xm_no_bypass)     // bypass from memory if dx_rs == xm_rd
                        ? xm_out_O : data_writeReg;        // and xm_opcode is not sw, bne, blt, jr
    assign A_bypass_2 = ((A_xm_bypass && ~xm_no_bypass) || // bypass from writeback if dx_rs == mw_rd
                        (A_mw_bypass && ~mw_no_bypass))    // and mw_opcode is not sw, bne, blt, jr
                        ? A_bypass_1 : dx_out_A;  
    assign ALU_in_A = (x_rs == 5'b00000) ? dx_out_A : A_bypass_2;
    // ALU operand B
    // B: if xm_rd == dx_rt --> B = xm_out_O
    //    if mw_rd == dx_rt --> B = data_writeReg
    //    else --> B = dx_out_B
    wire [31:0] B_choice, B_bypass_1, B_bypass_2;
    wire B_xm_bypass, B_mw_bypass, B_no_bypass;
    assign B_xm_bypass = x_rt == m_rd; 
    assign B_mw_bypass = x_rt == w_rd;
    assign B_bypass_1 = (B_xm_bypass && ~xm_no_bypass)     // bypass from memory if dx_rt == xm_rd 
                        ? xm_out_O : data_writeReg;        // and xm_opcode is not sw, bne, blt, jr
    assign B_bypass_2 = ((B_xm_bypass && ~xm_no_bypass) || // bypass from writeback if dx_rs == mw_rd
                        (B_mw_bypass && ~mw_no_bypass))    // and mw_opcode is not sw, bne, blt, jr
                        ? B_bypass_1 : dx_out_B;  
    assign B_choice = (x_rt == 5'b00000) ? dx_out_B : B_bypass_2;
    assign ALU_in_B = ((x_opcode == 5'b00101) || // if addi (00101)
                      (x_opcode == 5'b00111) ||  // or sw (00111)
                      (x_opcode == 5'b01000))    // or lw (01000)
                      ? x_imm : B_choice;        // --> B = immediate
    // ALU operation
    wire isNotEqual, isLessThan, alu_overflow;
    wire [31:0] alu_out;
    alu ALU (ALU_in_A, ALU_in_B, x_ALUop, x_shamt, alu_out, isNotEqual, isLessThan, alu_overflow);
    // MULTDIV operation
    wire ctrl_MULT, ctrl_DIV, multdiv_exception, multdiv_RDY;
    wire [31:0] multdiv_result;
    assign ctrl_MULT = (x_ALUop == 5'b00110) && (x_opcode == 5'b00000);
    assign ctrl_DIV = (x_ALUop == 5'b00111) && (x_opcode == 5'b00000);
    wire multdiv_start; // if ctrl_MULT or ctrl_DIV is asserted --> multdiv_start = 1
    assign multdiv_start = (ctrl_MULT || ctrl_DIV);
    wire multdiv_ongoing; // if a multdiv operation is taking place --> multdiv_ongoing = 1
    wire multdiv_op, multdiv_ongoing_in, multdiv_ongoing_en; 
    assign multdiv_ongoing_in = multdiv_RDY ? 1'b0 : 1'b1;
    assign multdiv_ongoing_en = (multdiv_start || multdiv_RDY) ? 1'b1 : 1'b0;
    dffe_ref ongoing_multdiv (multdiv_op, multdiv_ongoing_in, clock, multdiv_ongoing_en, 1'b0); // use a d flip-flop to ensure that multdiv_ongoing asserts high the cycle
    assign multdiv_ongoing = multdiv_op && ~multdiv_start;                                      // after multdiv_start and remains high until multdiv_RDY = 1
    wire [31:0] mult_in_A, mult_in_B, multdiv_instruction;
    register mult_A (clock, 1'b0, multdiv_start, ALU_in_A, mult_in_A); // use registers to store the values of A and B because ALU_in_A and ALU_in_B 
    register mult_B (clock, 1'b0, multdiv_start, ALU_in_B, mult_in_B); // will be flushed when stalling to finish a multdiv operation
    wire multdiv_inst_en; // if dx_in_ir is a multdiv operation --> mult_inst_en = 1 (enable writing to the register iff the instruction is multdiv)
    assign multdiv_inst_en = (dx_in_ir[31:27] == 5'b00000) && (dx_in_ir[6:2] == 5'b00110 || dx_in_ir[6:2] == 5'b00111);
    register mult_ir (clock, 1'b0, multdiv_inst_en, dx_in_ir, multdiv_instruction);
    multdiv MULTDIV (mult_in_A, mult_in_B, ctrl_MULT, ctrl_DIV, clock, multdiv_result, multdiv_exception, multdiv_RDY);
    wire use_mult; // if multdiv_instruction is a multdiv operation --> use_mult = 1
    assign use_mult = (multdiv_instruction[31:27] == 5'b00000) &&                                     // opcode = 5'b00000 = R instruction
                      (multdiv_instruction[6:2] == 5'b00110 || multdiv_instruction[6:2] == 5'b00111); // ALUop = 5'b00110 or 5'b00111 (mult or div)
    // overflow handling
    // $rstatus: if add - 00000 (00000) --> $rstatus = 1
    //           if addi - 00101 --> $rstatus = 2
    //           if sub - (00000 (00001) --> $rstatus = 3
    //           if mul -00000 (00110) --> $rstatus = 4
    //           if div - 00000 (00111) --> $rstatus = 5
    wire overflow;
    assign overflow = alu_overflow || (multdiv_RDY && multdiv_exception && use_mult);
    wire [31:0] rstatus_val, zero, two, three, four, five;
    assign zero = 32'b00000000000000000000000000000000;
    assign two = 32'b00000000000000000000000000000010;
    assign three = 32'b00000000000000000000000000000011;
    assign four = 32'b00000000000000000000000000000100;
    assign five = 32'b00000000000000000000000000000101;
    wire [2:0] rstatus_select;
    assign rstatus_select[0] = ((x_ALUop == 5'b00000) && alu_overflow) ||
                               ((x_ALUop == 5'b00001) && alu_overflow) ||
                               ((x_ALUop == 5'b00111) && multdiv_exception);
    assign rstatus_select[1] = ((x_ALUop == 5'b00001) || (x_opcode == 5'b00101)) && alu_overflow;
    assign rstatus_select[2] = x_ALUop[2] && multdiv_exception;
    mux_8 rstatus_val_choice (rstatus_val, rstatus_select, zero, one, two, three, four, five, zero, zero);
    wire [31:0] overflow_inst; // if overflow --> write rstatus_val to $rstatus and discard result
    assign overflow_inst[31:27] = x_opcode; 
    assign overflow_inst[26:22] = 5'b11110; // $rstatus
    assign overflow_inst[21:0] = dx_out_ir[21:0];
    assign xm_in_ir = overflow ? overflow_inst : dx_out_ir;
    // xm_in_O: if jal (00011) --> xm_in_O = dx_out_pc
    //          if setx (10101) --> xm_in_O = x_imm
    //          if overflow --> xm_in_O = rstatus_val
    //          else --> xm_in_O = alu_out
    wire [31:0] xm_in_O_if_jal, xm_in_O_if_setx;
    assign xm_in_O_if_jal = (x_opcode == 5'b00011) ? dx_out_pc : alu_out;
    assign xm_in_O_if_setx = (x_opcode == 5'b10101) ? x_imm : xm_in_O_if_jal;
    assign xm_in_O = overflow ? rstatus_val : xm_in_O_if_setx;
    assign xm_in_B = B_choice;
    // PC
    wire [31:0] pc_plus_imm;
    alu_adder pc_add_imm (dx_out_pc, x_imm, 1'b0, pc_plus_imm); // compute PC+1+imm
    wire pc_branch, pc_imm, pc_rd;
    assign pc_branch = ((x_opcode == 5'b00010) && isNotEqual) || // bne
                       ((x_opcode == 5'b00110) && isLessThan);   // blt
    assign pc_imm = (x_opcode == 5'b00001) ||                    // j
                    (x_opcode == 5'b00011) ||                    // jal
                    ((x_opcode == 5'b10110) && isNotEqual);      // bex
    assign pc_rd = (x_opcode == 5'b00100);                       // jr

    // MEMORY
    assign address_dmem = xm_out_O;
    assign wren = (m_opcode == 5'b00111) ? 1'b1 : 1'b0; // if sw (00111) --> wren = 1
    wire mem_bypass_select;                              // mem_bypass_select = 1
    assign mem_bypass_select = (m_opcode == 5'b00111) && // if m_out_ir is sw (00111)
                               (w_opcode == 5'b01000) && // and w_out_ir is lw (01000)
                               (m_rd == w_rd);           // m_rd == w_rd
    wire mem_no_bypass; // if sw, bne, blt, or jr, and m_rd == w_rd --> don't bypass
    assign mem_no_bypass = ((w_opcode == 5'b00111) || // sw
                           (w_opcode == 5'b00010) ||  // bne
                           (w_opcode == 5'b00110) ||  // blt
                           (w_opcode == 5'b00100)) && // jr
                           (m_rd == w_rd);
    assign data = (mem_bypass_select && ~mem_no_bypass) ? data_writeReg : xm_out_B;
    assign mw_in_O = xm_out_O;
    assign mw_in_D = q_dmem;
    assign mw_in_ir = xm_out_ir;

    // WRITEBACK
    // ctrl_writeReg: if multdiv_RDY and use_mult --> ctrl_writeReg = multdiv_instruction[26:22]
    //                else --> ctrl_writeReg = w_rd
    assign ctrl_writeReg = (multdiv_RDY && use_mult) ? multdiv_instruction[26:22] : w_rd;
    // data_writeReg: if lw (01000) --> data_writeReg = mw_out_D
    //                if multdiv_RDY and use_mult --> data_writeReg = multdiv_result
    //                else --> data_writeReg = mw_out_O
    wire [31:0] data_writeReg_if_multdiv;
    assign data_writeReg_if_multdiv = (multdiv_RDY && use_mult) ? multdiv_result : mw_out_O;
    assign data_writeReg = (w_opcode == 5'b01000) ? q_dmem : data_writeReg_if_multdiv;
    // ctrl_writeEnable: if R (00000) or addi (00101) or lw (01000) or jal (00011) or setx (10101) --> ctrl_writeEnable = 1
    assign ctrl_writeEnable = (w_opcode == 5'b00000) || // R
                              (w_opcode == 5'b00101) || // addi
                              (w_opcode == 5'b01000) || // lw
                              (w_opcode == 5'b00011) || // jal
                              (w_opcode == 5'b10101) || // setx
                              (w_opcode == 5'b11101);   // rotr

    // STALL LOGIC
    // stall = ((dx_ir_op == LOAD) && ((fd_ir_rs == dx_ir_rd) || 
    //         ((fd_ir_rt == dx_ir_rd) && (fd_ir_op != STORE)))) ||
    //         ((multdiv_start || multdiv_ongoing && ~multdiv_RDY))
    assign stall = ((x_opcode == 5'b01000) && ((d_rs == x_rd) || ((d_rt == x_rd) && (d_opcode != 5'b00111)))) ||
                   ((multdiv_start || multdiv_ongoing && ~multdiv_RDY));

endmodule
