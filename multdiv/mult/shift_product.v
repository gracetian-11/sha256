module shift_product(in_left, in_right, output_helper, out_left, out_right);
    
    input signed [31:0] in_left, in_right;
    output output_helper;
    output signed [31:0] out_left, out_right;
    
    assign out_left = in_left >>> 2;
    assign output_helper = in_right[1];

    wire signed [31:0] temp_right;
    assign temp_right = in_right >>> 2;
    assign out_right[29:0] = temp_right[29:0];
    assign out_right[30] = in_left[0];
    assign out_right[31] = in_left[1];

endmodule