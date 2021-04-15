module mw_latch(
    in_O, in_D, in_ir, 
    out_O, out_D, out_ir, 
    clock, ctrl_reset, input_enable);

    input clock, ctrl_reset, input_enable;
    input [31:0] in_O, in_D, in_ir;
    output [31:0] out_O, out_D, out_ir;

    register O (clock, ctrl_reset, input_enable, in_O, out_O);
    register D (clock, ctrl_reset, input_enable, in_D, out_D);    
    register ir (clock, ctrl_reset, input_enable, in_ir, out_ir);

endmodule