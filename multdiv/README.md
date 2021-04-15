# Project Checkpoint 3: MULTDIV
#### Grace Tian

This MULTDIV module performs multiplication and division on two 32-bit wide data operands.

### MULTDIV Module Interface

multdiv(data_operandA, data_operandB, ctrl_MULT, ctrl_DIV, clock, data_result, data_exception, data_resultRDY);

#### Inputs

data_operandA and data_operandB are the two 32-bit operands for each operation. ctrl_MULT is asserted for one cycle if a multiplication operation should start. ctrl_DIV is asserted for one cycle if a division operation should start. If a current operation is underway, assertion of either ctrl_MULT or ctrl_DIV will terminate the current operation and restart.
clock is the clock signal for the module.

#### Outputs

data_result is the result of the operation. data_exception asserts true if and only if there is an error (i.e. divide by 0 or there is an overflow in multiplication). data_resultRDY asserts true on the rising edge of the clock for one cycle if and only if an operation has been completed.

### MULT

mult(data_operandA, data_operandB, ctrl_MULT, clock, mult_data_result, mult_data_exception, mult_data_resultRDY);

Multiplication is performed using Modified Boothe's Algorithm. In Modified Boothe's Algorithm, the 64-bit product will always be correct, which is reprented here using two 32-bit registers with ctrl_MULT as the reset. However, this module assumes a 32-bit world and thus the result of the multiplication is the output of the register containing the lower 32 bits of the product.

Initially, the lower 32 bits of the product is simply the multiplier. On every cycle, the module mult_control uses the least two significant bits of the product and an extra bit on the right to determine what should be added to the upper 32 bits of the product. mult_control outputs this signal as control_out. The possible bit combinations and what the value for control_out should be for each of them are listed below:

    000: 0 (do nothing)
    001: positive multiplicand
    010: positive multiplicand
    011: positive multiplicand shifted to the left by 1
    100: negative multiplicand shifted to the left by 1
    101: negative multiplicand
    110: negative multiplicand
    111: 0 (do nothing)

After the addition, the entire product, including the extra bit on the right, is arithmetically shifted to the right by 2. 

This process is repeated for 16 cycles, assuming the process is not interrupted. On the 17th cycle, data_resultRDY is asserted and the parent module latches on to the value of data_result on that cycle, which is simply the lower 32 bits of the product.

The module mult_exception is used to determine if there is an exception. For a multiplication operation, an exception exists if there is an overflow and the product cannot be represented using only 32 bits. 

### DIV

div(data_operandA, data_operandB, ctrl_DIV, clock, data_result, data_exception, data_resultRDY);

Division is performed using the non-restoring division algorithm. This algorithm works only for unsigned integers, so in the parent module multdiv, if a data operand is negative, then it is negated before being passed into div. If one and only one of the operands is negative, then the final result of the division operation is negated as well. 

Similar to multiplication, 64 bits are used in division to compute the correct quotient and are again stored in two 32-bit registers with ctrl_DIV as the reset. The upper 32 bits is the remainder and the lower 32 bits is the quotient, data_result.

On the start of every cycle, all 64 bits are shifted to the left by 1. Then, if the most significant bit of the remainder is 0, the remainder is equal to the divisor (data_operandB) subtracted from the remainder. If the most significant bit of the remainder is 1, then the remainder is equal to the divisor added to the remainder.

On the next step, the least significant bit of the quotient is set to 0 if the most significant bit of the remainder is 1 and is set to 1 if the most significant bit of the remainder is 0.

This process repeats itself 32 times, one for each bit in the divident (data_operandA).

After 32 cycles, if the most significant bit of the remainder is 1, the remainder is set to the sum of the divisor and the current remainder. This is the final remainder and the lower 32 bits are the final quotient.

data_exception is only asserted if there a division by 0.