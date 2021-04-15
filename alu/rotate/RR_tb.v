`timescale 1 ns / 100 ps
module RR_tb;

    // define inputs and outputs
    wire [31:0] in;
    wire [4:0] rotate_amt;
    wire [31:0] out;

    // define module
    right_rotator RR(.in(in), .out(out), .rotate_amt(rotate_amt));

    integer i, j;
    assign in = i[31:0];
    assign rotate_amt = j[4:0];

    initial begin
        for(i = 0; i < 256; i = i + 1) begin
            #20;
            for(j = 0; j < 32; j = j + 1) begin
                #20;
                $display("A:%b, rotate:%b => Result:%b", in[7:0], rotate_amt, out[7:0]);
            end
        end
        
        $finish;
    end

     initial begin
        $dumpfile("RR.vcd");
        $dumpvars(0, RR_tb);
    end


endmodule