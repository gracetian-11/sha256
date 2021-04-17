
// This register file contians 64 32 bit registers 
// possible operations include reading from a single particular register and writing to a single register
module regfile64(clock, WE, reset, ctrl_writeReg, 
    ctrl_readReg, data_writeReg, data_readReg);

    input clock, WE, reset;
    input [5:0] ctrl_writeReg, ctrl_readReg;
    input [31:0] data_writeReg;
    output [31:0] data_readReg;

    reg[63:0] registers[31:0];

    integer count;
    initial begin
        for (count = 0; count < 64; count = count + 1)
            registers[count] <= 0
    end

    integer i;
    always @(posedge clock or posedge reset)
    begin
        if(reset)
        begin
            for(i = 0; i < 63; i = i + 1)
            begin
                registers[i] <= 32'd0;
            end
        end
        else
            if(WE && ctrl_writeReg != 5'd0)
                registers[ctrl_writeReg] <= data_writeReg;

    end

    assign data_readReg = registers[ctrl_readReg];


endmodule