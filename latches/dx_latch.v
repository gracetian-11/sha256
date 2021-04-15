module dx_latch(
    in_A, in_B, in_ir, in_pc,
    out_A, out_B, out_ir, out_pc,
    clock, ctrl_reset, input_enable);

    input clock, ctrl_reset, input_enable;
    input [31:0] in_A, in_B, in_ir, in_pc;
    output [31:0] out_A, out_B, out_ir, out_pc;

    register pc (clock, ctrl_reset, input_enable, in_pc, out_pc);
    register A (clock, ctrl_reset, input_enable, in_A, out_A);
    register B (clock, ctrl_reset, input_enable, in_B, out_B);    
    register ir (clock, ctrl_reset, input_enable, in_ir, out_ir);

endmodule