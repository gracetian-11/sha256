# Project Checkpoint 1: ALU
#### Grace Tian

This ALU module performs the following operations on two 32-bit wide data operands: ADD, SUB, AND, OR, SLL, and SRA.

### ALU Module Interface

alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

All required modules for the ALU are listed in module.txt.

#### Inputs

data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt are the inputs to the module. data_operandA and data_operandB are 32 bits wide and are the inputs that the ALU will perform operations on. ctrl_ALUopcode is five bits and is used to select between different operations. ctrl_shiftamt is five bits and is only used in SLL and SRA operations to determine how much to shift data_operandA by.

#### Outputs

data_result, isNotEqual, isLessThan, and overflow are the outputs. data_result is the outcome of the ALU operation and is 32 bits wide. isNotEqual, isLessThan, and overflow are each one bit. isNotEqual asserts true if data_operandA and data_operandB are not equal and is only guaranteed to be correct after a SUB operation. The module not_eq is used to determine the value of isNotEqual. isLessThan asserts true if data_operandA is strictly less than data_operandB and is only guaranteed to be correct after a SUB operations. overflow asserts true if there is an overflow after an ADD or SUB operation.

### ALU Operations

#### ADD/SUB

alu_adder(data_operandA, data_operandB, c_0, data_result);

The alu_adder module is a hierarchical (two-level) carry-lookahead adder to sum data_operandA, data_operandB, and c_0. The submodule CLA is a "block" that implements a carry-lookahead adder for two 8-bit inputs. The alu_adder module chains together four of these blocks in a second level of lookahead circuits to determine the sum of two 32-bit inputs, data_result. The opcode for ADD is 00000.

The SUB operation is simply the sum of data_operandA, the complement of data_operandB, and 1. c_0 is 1 if the SUB operation is selected and 0 otherwise. Thus, there is no need to recreate a circuit for subtraction; using a mux to select between data_operandB and its complement is sufficient. The alu_not module is used to invert each bit of data_operandB. The opcode for SUB is 00001.

#### AND

alu_and(data_operandA, data_operandB, data_result);

The alu_and module performs bitwise *and* on data_operandA and data_operandB. alu_and is built from thirty two two-input *and* gates. Each *and* gate takes in as input corresponding bits from data_operandA and data_operandB and outputs the corresponding bit of the result, data_result. The opcode for AND is 00010.

#### OR

alu_or(data_operandA, data_operandB, data_result);

The alu_or module performs bitwise *or* on data_operandA and data_operandB. alu_or is built from thirty two two-input *or* gates. Each *or* gate takes in as input corresponding bits from data_operandA and data_operandB and outputs the corresponding bit of the result, data_result. The opcode for OR is 00011.

#### SLL

alu_sll(data_operandA, ctrl_shiftamt, data_result);

The alu_sll module performs a logical left shift of ctrl_shiftamt bits on data_operandA. alu_sll is a 32-bit barrel shifter implemented with a sequence of modules that shift the input by 16, 8, 4, 2, and 1. Five intermediate muxes, with one bit of ctrl_shiftamt as the select for each of them, are used to determine the final output, data_result. The opcode for SLL is 00100.

#### SRA

alu_sra(data_operandA, ctrl_shiftamt, data_result);

The alu_sra module performs an arithmetic right shift of ctrl_shiftamt bits on data_operandA. alu_sra is a 32-bit barrel shifter implemented with a sequence of modules that shift the input by 16, 8, 4, 2, and 1. Five intermediate muxes, with one bit of ctrl_shiftamt as the select for each of them, are used to determine the final output. The opcode for SRA is 00101.
