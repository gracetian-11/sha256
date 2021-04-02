module fd_latch(
    in_ir, in_pc,
    out_ir, out_pc,
    clock, ctrl_reset, input_enable);

    input clock, ctrl_reset, input_enable;
    input [31:0] in_ir, in_pc;
    output [31:0] out_ir, out_pc;

    register pc (clock, ctrl_reset, input_enable, in_pc, out_pc);
    register ir (clock, ctrl_reset, input_enable, in_ir, out_ir);

endmodule