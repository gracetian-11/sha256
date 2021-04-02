module control (instruction, opcode, rd, rs, rt, shamt, ALUop, imm);

    input [31:0] instruction;
    output [4:0] opcode, rd, rs, rt, shamt, ALUop;
    output [31:0] imm;

    wire [4:0] opcode;
    assign opcode = instruction[31:27];

    wire r_type, i_type, ji_type, jii_type;

    // R
    // opcode: 00000
    assign r_type = ~opcode[4] && ~opcode[3] && ~opcode[2] && ~opcode[1] && ~opcode[0];
    
    // I
    // addi: 00101
    // sw: 00111
    // lw: 01000
    // bne: 00010
    // blt: 00110
    assign i_type = (~opcode[4] && ~opcode[3] && opcode[2] && ~opcode[1] && opcode[0]) ||
                    (~opcode[4] && ~opcode[3] && opcode[2] && opcode[1] && opcode[0]) ||
                    (~opcode[4] && opcode[3] && ~opcode[2] && ~opcode[1] && ~opcode[0]) ||
                    (~opcode[4] && ~opcode[3] && ~opcode[2] && opcode[1] && ~opcode[0]) || 
                    (~opcode[4] && ~opcode[3] && opcode[2] && opcode[1] && ~opcode[0]);

    // JI
    // j: 00001
    // jal: 00011
    // bex: 10110
    // setx: 10101
    assign ji_type = (~opcode[4] && ~opcode[3] && ~opcode[2] && ~opcode[1] && opcode[0]) ||
                     (~opcode[4] && ~opcode[3] && ~opcode[2] && opcode[1] && opcode[0]) ||
                     (opcode[4] && ~opcode[3] && opcode[2] && opcode[1] && ~opcode[0]) ||
                     (opcode[4] && ~opcode[3] && opcode[2] && ~opcode[1] && opcode[0]);

    // JII
    // jr: 00100
    assign jii_type = ~opcode[4] && ~opcode[3] && opcode[2] && ~opcode[1] && ~opcode[0];

    wire [31:0] i_imm; // signed
    assign i_imm[16:0] = instruction[16:0];
    wire sign;
    assign sign = i_imm[16];
    wire [15:0] ones, zeros;
    assign ones = 15'b111111111111111;
    assign zeros = 15'b0;
    assign i_imm[31:17] = sign ? ones : zeros;

    wire [31:0] ji_imm;
    wire [26:0] target;
    assign target = instruction[26:0]; // unsigned
    assign ji_imm[26:0] = target;
    assign ji_imm[31:27] = 5'b0;

    assign imm = i_type ? i_imm : ji_imm;
    assign shamt = instruction[11:7];

    wire is_sw, is_lw, is_bne, is_blt, is_bex, is_setx, is_jal;
    assign is_sw = opcode == 5'b00111;
    assign is_lw = opcode == 5'b01000;
    assign is_bne = opcode == 5'b00010;
    assign is_blt = opcode == 5'b00110;
    assign is_bex = opcode == 5'b10110;
    assign is_setx = opcode == 5'b10101;
    assign is_jal = opcode == 5'b00011;
    
    // if blt or bne or bex--> ALUop = 5'b00001 (because isLessThan in ALU is only correct after a SUB operation)
    // if I and not blt --> ALUop = 5'b00000
    // else --> ALUop = instruction[6:2]
    wire [4:0] ALUop_if_I;
    assign ALUop_if_I = (i_type) ? 5'b00000 : instruction[6:2];
    assign ALUop = (is_blt || is_bne || is_bex) ? 5'b00001 : ALUop_if_I;

    wire [4:0] rd, rs, rt;

    // if jal (00011) --> rd = $r31 = 5'b11111
    // if setx (10101) --> rd = $rstatus = 5'b11110
    // else --> rd = instruction[26:22]
    wire [4:0] rd_if_setx;
    assign rd_if_setx = is_setx ? 5'b11110 : instruction[26:22];
    assign rd = is_jal ? 5'b11111 : rd_if_setx;

    // A
    // if bne (00010) or blt (00110) or jr (00100) --> rs = rd = instruction[26:22]
    // if bex (10110) --> rs = $rstatus = 5'b11110
    // else --> rs = instruction[21:17]
    wire [4:0] rs_if_bne_or_blt;
    assign rs_if_bne_or_blt = (is_bne || is_blt || (opcode == 5'b00100)) ? instruction[26:22] : instruction[21:17];
    assign rs = is_bex ? 5'b11110 : rs_if_bne_or_blt;

    // B
    // if I (01) and not addi (00101) --> rt = rs = instruction[21:17]
    // if sw (00111) --> rt = rd = instruction[26:22]
    // if bex (10110) --> rt = 5'b0
    // else --> rt = instruction[16:12]
    wire [4:0] rt_if_I_not_addi, rt_if_bex;
    assign rt_if_I_not_addi = (is_lw || is_bne || is_blt) ? instruction[21:17] : instruction[16:12];
    assign rt_if_bex = is_bex ? 5'b0 : rt_if_I_not_addi;
    assign rt = is_sw ? instruction[26:22] : rt_if_bex;

endmodule