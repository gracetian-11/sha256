module tff(t, clock, ctrl_reset, q);

    input t, clock, ctrl_reset;
    output q;

    wire d;
    xor xor_d (d, t, q);

    wire en;
    assign en = 1'b1;

    dffe_ref dff (q, d, clock, en, ctrl_reset);

endmodule