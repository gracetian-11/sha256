module mux_2_one_bit(out, select, in0, in1);

    input select;
    input in0, in1;
    output out;
    assign out = select ? in1 : in0;
    
endmodule

module mux_2(out, select, in0, in1);

    input select;
    input [31:0] in0, in1;
    output [31:0] out;
    assign out = select ? in1 : in0;
    
endmodule

module mux_4_one_bit(out, select, in0, in1, in2, in3);

    input [1:0] select;
    input in0, in1, in2, in3;
    output out;
    wire w1, w2;
    
    mux_2_one_bit first_top(w1, select[0], in0, in1);
    mux_2_one_bit first_bottom(w2, select[0], in2, in3);
    mux_2_one_bit second(out, select[1], w1, w2);

endmodule

module mux_4(out, select, in0, in1, in2, in3);

    input [1:0] select;
    input [31:0] in0, in1, in2, in3;
    output [31:0] out;
    wire [31:0] w1, w2;
    
    mux_2 first_top(w1, select[0], in0, in1);
    mux_2 first_bottom(w2, select[0], in2, in3);
    mux_2 second(out, select[1], w1, w2);

endmodule

module mux_8_one_bit(out, select, in0, in1, in2, in3, in4, in5, in6, in7);

    input [2:0] select;
    input in0, in1, in2, in3, in4, in5, in6, in7;
    output out;
    wire w1, w2;
    
    mux_4_one_bit first_top(w1, select[1:0], in0, in1, in2, in3);
    mux_4_one_bit first_bottom(w2, select[1:0], in4, in5, in6, in7);
    mux_2_one_bit second(out, select[2], w1, w2);

endmodule

module mux_8(out, select, in0, in1, in2, in3, in4, in5, in6, in7);

    input [2:0] select;
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
    output [31:0] out;
    wire [31:0] w1, w2;
    
    mux_4 first_top(w1, select[1:0], in0, in1, in2, in3);
    mux_4 first_bottom(w2, select[1:0], in4, in5, in6, in7);
    mux_2 second(out, select[2], w1, w2);

endmodule

module mux_16_one_bit(out, select, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15);

    input [3:0] select;
    input in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15;
    output out;
    wire w1, w2;
    
    mux_8_one_bit first_top(w1, select[2:0], in0, in1, in2, in3, in4, in5, in6, in7);
    mux_8_one_bit first_bottom(w2, select[2:0], in8, in9, in10, in11, in12, in13, in14, in15);
    mux_2_one_bit second(out, select[3], w1, w2);

endmodule

module mux_16(out, select, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15);

    input [3:0] select;
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15;
    output [31:0] out;
    wire [31:0] w1, w2;
    
    mux_8 first_top(w1, select[2:0], in0, in1, in2, in3, in4, in5, in6, in7);
    mux_8 first_bottom(w2, select[2:0], in8, in9, in10, in11, in12, in13, in14, in15);
    mux_2 second(out, select[3], w1, w2);

endmodule

module mux_32_one_bit(out, select, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31);

    input [4:0] select;
    input in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
    output out;
    
    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;

    // layer one: 8 4:1 muxes
    mux_4_one_bit first(w1, select[1:0], in0, in1, in2, in3);
    mux_4_one_bit second(w2, select[1:0], in4, in5, in6, in7);
    mux_4_one_bit third(w3, select[1:0], in8, in9, in10, in11);
    mux_4_one_bit fourth(w4, select[1:0], in12, in13, in14, in15);
    mux_4_one_bit fifth(w5, select[1:0], in16, in17, in18, in19);
    mux_4_one_bit sixth(w6, select[1:0], in20, in21, in22, in23);
    mux_4_one_bit seventh(w7, select[1:0], in24, in25, in26, in27);
    mux_4_one_bit eigth(w8, select[1:0], in28, in29, in30, in31);
    
    // layer two: 2 4:1 muxes
    mux_4_one_bit first_mux_8(w9, select[3:2], w1, w2, w3, w4);
    mux_4_one_bit second_mux_8(w10, select[3:2], w5, w6, w7, w8);
    
    // layer three: 1 2:1 mux
    mux_2_one_bit final_mux_32(out, select[4], w9, w10);

endmodule

module mux_32(out, select, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31);

    input [4:0] select;
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
    output [31:0] out;
    
    wire [31:0] w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;

    // layer one: 8 4:1 muxes
    mux_4 first(w1, select[1:0], in0, in1, in2, in3);
    mux_4 second(w2, select[1:0], in4, in5, in6, in7);
    mux_4 third(w3, select[1:0], in8, in9, in10, in11);
    mux_4 fourth(w4, select[1:0], in12, in13, in14, in15);
    mux_4 fifth(w5, select[1:0], in16, in17, in18, in19);
    mux_4 sixth(w6, select[1:0], in20, in21, in22, in23);
    mux_4 seventh(w7, select[1:0], in24, in25, in26, in27);
    mux_4 eigth(w8, select[1:0], in28, in29, in30, in31);
    
    // layer two: 2 4:1 muxes
    mux_4 first_mux_8(w9, select[3:2], w1, w2, w3, w4);
    mux_4 second_mux_8(w10, select[3:2], w5, w6, w7, w8);
    
    // layer three: 1 2:1 mux
    mux_2 final_mux_32(out, select[4], w9, w10);

endmodule