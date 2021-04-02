module register (clock, ctrl_reset, input_enable, input_data, output_data);

    input clock, ctrl_reset, input_enable;
    input [31:0] input_data;
	output [31:0] output_data;

    dffe_ref dff0(output_data[0], input_data[0], clock, input_enable, ctrl_reset);
    dffe_ref dff1(output_data[1], input_data[1], clock, input_enable, ctrl_reset);
    dffe_ref dff2(output_data[2], input_data[2], clock, input_enable, ctrl_reset);
    dffe_ref dff3(output_data[3], input_data[3], clock, input_enable, ctrl_reset);
    dffe_ref dff4(output_data[4], input_data[4], clock, input_enable, ctrl_reset);
    dffe_ref dff5(output_data[5], input_data[5], clock, input_enable, ctrl_reset);
    dffe_ref dff6(output_data[6], input_data[6], clock, input_enable, ctrl_reset);
    dffe_ref dff7(output_data[7], input_data[7], clock, input_enable, ctrl_reset);
    dffe_ref dff8(output_data[8], input_data[8], clock, input_enable, ctrl_reset);
    dffe_ref dff9(output_data[9], input_data[9], clock, input_enable, ctrl_reset);
    dffe_ref dff10(output_data[10], input_data[10], clock, input_enable, ctrl_reset);
    dffe_ref dff11(output_data[11], input_data[11], clock, input_enable, ctrl_reset);
    dffe_ref dff12(output_data[12], input_data[12], clock, input_enable, ctrl_reset);
    dffe_ref dff13(output_data[13], input_data[13], clock, input_enable, ctrl_reset);
    dffe_ref dff14(output_data[14], input_data[14], clock, input_enable, ctrl_reset);
    dffe_ref dff15(output_data[15], input_data[15], clock, input_enable, ctrl_reset);
    dffe_ref dff16(output_data[16], input_data[16], clock, input_enable, ctrl_reset);
    dffe_ref dff17(output_data[17], input_data[17], clock, input_enable, ctrl_reset);
    dffe_ref dff18(output_data[18], input_data[18], clock, input_enable, ctrl_reset);
    dffe_ref dff19(output_data[19], input_data[19], clock, input_enable, ctrl_reset);
    dffe_ref dff20(output_data[20], input_data[20], clock, input_enable, ctrl_reset);
    dffe_ref dff21(output_data[21], input_data[21], clock, input_enable, ctrl_reset);
    dffe_ref dff22(output_data[22], input_data[22], clock, input_enable, ctrl_reset);
    dffe_ref dff23(output_data[23], input_data[23], clock, input_enable, ctrl_reset);
    dffe_ref dff24(output_data[24], input_data[24], clock, input_enable, ctrl_reset);
    dffe_ref dff25(output_data[25], input_data[25], clock, input_enable, ctrl_reset);
    dffe_ref dff26(output_data[26], input_data[26], clock, input_enable, ctrl_reset);
    dffe_ref dff27(output_data[27], input_data[27], clock, input_enable, ctrl_reset);
    dffe_ref dff28(output_data[28], input_data[28], clock, input_enable, ctrl_reset);
    dffe_ref dff29(output_data[29], input_data[29], clock, input_enable, ctrl_reset);
    dffe_ref dff30(output_data[30], input_data[30], clock, input_enable, ctrl_reset);
    dffe_ref dff31(output_data[31], input_data[31], clock, input_enable, ctrl_reset);

endmodule