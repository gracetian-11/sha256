# Project Checkpoint 2: REGFILE
#### Grace Tian

This REGFILE module supports 2 read ports, 1 write port, and 32 32-bit registers.

### REGFILE Module Interface

regfile(clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg, ctrl_readRegA, ctrl_readRegB, data_writeReg, data_readRegA, data_readRegB)

#### Inputs

clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg, ctrl_readRegA, ctrl_readRegB, and data_writeReg are the inputs to the module.

clock, ctrl_writeEnable, and ctrl_reset are 1 bit.
ctrl_writeReg, ctrl_readRegA, and ctrl_readRegB are 5 bits.
data_writeReg is 32 bits.

clock is an oscillating signal. Register values change on the rising edge of the clock. ctrl_writeEnable dictates whether or not data_writeReg is written to the register determined by ctrl_writeReg. If ctrl_reset is high, the value in the registers are reset. ctrl_writeReg contains the number of the register that data_writeReg should be written to if ctrl_writeEnable is high. ctrl_readRegA is the register to read data_readRegA from. ctrl_readRegB is the register to read data_readRegB from. data_writeReg is the value that should be written to ctrl_writeReg if ctrl_writeEnable is high.

#### Outputs

data_readRegA and data_readRegB are the outputs of the module are both 32 bits. data_readRegA is the result of reading from the register specified by ctrl_readRegA. data_readRegB is the result of reading from the register specified by ctrl_readRegB.

#### Writing to a Register

The control signal ctrl_writeReg is wired to a decoder and all but one of the 32-bit output is off. The output bit that is high is the register that should be written to if ctrl_writeEnable is on. This is done through 32 individual AND gates with inputs ctrl_writeEnable and one bit of the output of the decoder. Each output is wired to the input_enable of its corresponding register.

#### Reading from a Register

The control signals ctrl_readRegA and ctrl_readRegB specify which registers to read from. ctrl_readRegA is passed into a decoder. Each bit of the result of the decoder is the select bit of a tri-state buffer. If the select bit is on, then the output of the tri-state buffer is the result of the corresponding register specified by ctrl_readRegA. If the select bit is off, then the output is a high-impedance signal. data_readRegA is assigned to the output of these tri-state buffers. The same implementation is used to determine the value of data_readRegB using ctrl_readRegB.

### REGFILE Required Modules

All modules required for regfile are found in regfile.txt.

#### dffe_ref.v

dffe_ref(q, d, clk, en, clr);

The dffe_ref module defines a single D-flip flop. If enable is on, the value of the output q follows the value of the input d on the rising edge of the clock.

#### register.v

register(clock, ctrl_reset, input_enable, input_data, output_data);

The register module defines a single 32-bit register constructed from 32 individual D-flip flops. Each bit of the 32-bit input, input_data, is wired to the input of a single D-flip flop. The output of that D-flip flop is wired to the corresponding bit of the 32-bit output, output_data. If input_enable is on, then the value in input_data is written to the register. output_data reflects the current 32-bit value in the register.

#### decoder.v

decoder(out, select, enable);

The decoder module defines a binary decoder in which only one of the 32 outputs is on. decoder.v takes in a single bit as enable and uses the decoder_sll.v module to shift the enable bit to its proper position based on the control signal wired to select. This module is used in the register file to determine which registers should be read from and written to.

#### decoder_sll.v

decoder_sll(data_operandA, ctrl_shiftamt, data_result);

decoder_sll.v is a logical left shift circuit used in decoder.v to aid in determining which of the outputs should be on.