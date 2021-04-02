module xm_latch(
    in_O, in_B, in_ir, 
    out_O, out_B, out_ir, 
    clock, ctrl_reset, input_enable);

    input clock, ctrl_reset, input_enable;
    input [31:0] in_O, in_B, in_ir;
    output [31:0] out_O, out_B, out_ir;

    register O (clock, ctrl_reset, input_enable, in_O, out_O);
    register B (clock, ctrl_reset, input_enable, in_B, out_B);    
    register ir (clock, ctrl_reset, input_enable, in_ir, out_ir);

endmodule