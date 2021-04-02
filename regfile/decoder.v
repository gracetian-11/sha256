module decoder (out, select, enable);

    input [4:0] select;
    input enable;
    output [31:0] out;

    wire [31:0] en;
    
    assign en[0] = enable;
    assign en[1] = 1'b0;
    assign en[2] = 1'b0;
    assign en[3] = 1'b0;
    assign en[4] = 1'b0;
    assign en[5] = 1'b0;
    assign en[6] = 1'b0;
    assign en[7] = 1'b0;
    assign en[8] = 1'b0;
    assign en[9] = 1'b0;
    assign en[10] = 1'b0;
    assign en[11] = 1'b0;
    assign en[12] = 1'b0;
    assign en[13] = 1'b0;
    assign en[14] = 1'b0;
    assign en[15] = 1'b0;
    assign en[16] = 1'b0;
    assign en[17] = 1'b0;
    assign en[18] = 1'b0;
    assign en[19] = 1'b0;
    assign en[20] = 1'b0;
    assign en[21] = 1'b0;
    assign en[22] = 1'b0;
    assign en[23] = 1'b0;
    assign en[24] = 1'b0;
    assign en[25] = 1'b0;
    assign en[26] = 1'b0;
    assign en[27] = 1'b0;
    assign en[28] = 1'b0;
    assign en[29] = 1'b0;
    assign en[30] = 1'b0;
    assign en[31] = 1'b0;

    assign out = en << select;

endmodule