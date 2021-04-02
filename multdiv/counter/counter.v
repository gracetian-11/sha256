module clock_counter (clock, ctrl_reset, counter);

    input clock, ctrl_reset;
    output [4:0] counter;

    wire one;
    assign one = 1'b1;

    wire q_0, q_1, q_2, q_3, q_4;
    wire not_q_0, not_q_1, not_q_2, not_q_3;

    assign not_q_0 = ~q_0;
    assign not_q_1 = ~q_1;
    assign not_q_2 = ~q_2;
    assign not_q_3 = ~q_3;

    tff tff_0 (one, clock, ctrl_reset, q_0);
    tff tff_1 (one, not_q_0, ctrl_reset, q_1);
    tff tff_2 (one, not_q_1, ctrl_reset, q_2);
    tff tff_3 (one, not_q_2, ctrl_reset, q_3);
    tff tff_4 (one, not_q_3, ctrl_reset, q_4);

    assign counter[0] = q_0;
    assign counter[1] = q_1;
    assign counter[2] = q_2;
    assign counter[3] = q_3;
    assign counter[4] = q_4;
    
endmodule