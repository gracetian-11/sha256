`timescale 1 ns / 100 ps
module alu_sra_tb;

    wire [31:0] data_operandA;
    wire [4:0] ctrl_shiftamt;
    wire [31:0] data_result;    

    alu_sra sra_32(data_operandA, ctrl_shiftamt, data_result);

    integer i, j;
    assign data_operandA = i[31:0];
    assign ctrl_shiftamt = j[4:0];

    initial begin
        for(i = 0; i < 256; i = i + 1) begin
            #20;
            for(j = 0; j < 32; j = j + 1) begin
                #20;
                $display("A:%b, Shift:%b => Result:%b", data_operandA[7:0], ctrl_shiftamt, data_result[7:0]);
            end
        end
        
        $finish;
    end

    initial begin
        $dumpfile("alu_sra.vcd");
        $dumpvars(0, alu_sra_tb);
    end

endmodule