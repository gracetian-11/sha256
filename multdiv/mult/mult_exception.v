module mult_exception (mc, mp, product_left, product_right, data_exception);

    input [31:0] mc, mp, product_left, product_right;
    output data_exception;

    // check to make sure that product_left is either all 0's or all 1's
    wire not_all, and_result, nor_result;
    // and_result = 1 when all 1's
    and and_all (and_result, product_left[0], product_left[1], product_left[2], product_left[3], product_left[4], product_left[5], product_left[6], product_left[7], product_left[8], product_left[9], product_left[10], product_left[11], product_left[12], product_left[13], product_left[14], product_left[15], product_left[16], product_left[17], product_left[18], product_left[19], product_left[20], product_left[21], product_left[22], product_left[23], product_left[24], product_left[25], product_left[26], product_left[27], product_left[28], product_left[29], product_left[30], product_left[31]);
    // nor_result = 1 when all 0's
    nor nor_all (nor_result, product_left[0], product_left[1], product_left[2], product_left[3], product_left[4], product_left[5], product_left[6], product_left[7], product_left[8], product_left[9], product_left[10], product_left[11], product_left[12], product_left[13], product_left[14], product_left[15], product_left[16], product_left[17], product_left[18], product_left[19], product_left[20], product_left[21], product_left[22], product_left[23], product_left[24], product_left[25], product_left[26], product_left[27], product_left[28], product_left[29], product_left[30], product_left[31]);
    xnor is_all (not_all, and_result, nor_result);

    // check to make sure that product_left and product_right have the same sign
    // product_left[31] = 0 and product_right[31] = 0 --> exception = 0
    // product_left[31] = 0 and product_right[31] = 1 --> exception = 1
    // product_left[31] = 1 and product_right[31] = 0 --> exception = 1
    // product_left[31] = 1 and product_right[31] = 1 --> exception = 0
    wire prod_sign;
    xor xor_product_sign (prod_sign, product_left[31], product_right[31]);

    // check to make sure the sign of product_right matches the signs of the operands
    // mc[31] = 0 and mp[31] = 0 --> product_right[31] = 0
    // mc[31] = 0 and mp[31] = 1 --> product_right[31] = 1
    // mc[31] = 1 and mp[31] = 0 --> product_right[31] = 1
    // mc[31] = 1 and mp[31] = 1 --> product_right[31] = 0
    // product_right[31] = xor(mc[31], mp[31])
    wire correct_prod_sign, not_match;
    xor xor_op_sign (correct_prod_sign, mc[31], mp[31]);
    xor xor_sign_match (not_match, correct_prod_sign, product_right[31]);

    // there should be no exception if mc or mp is 0 and product_right is 0
    wire is_mc_zero, is_mp_zero;
    wire op_zero, prod_zero, no_exception;
    nor mc_zero (is_mc_zero, mc[0], mc[1], mc[2], mc[3], mc[4], mc[5], mc[6], mc[7], mc[8], mc[9], mc[10], mc[11], mc[12], mc[13], mc[14], mc[15], mc[16], mc[17], mc[18], mc[19], mc[20], mc[21], mc[22], mc[23], mc[24], mc[25], mc[26], mc[27], mc[28], mc[29], mc[30], mc[31]);
    nor mp_zero (is_mp_zero, mp[0], mp[1], mp[2], mp[3], mp[4], mp[5], mp[6], mp[7], mp[8], mp[9], mp[10], mp[11], mp[12], mp[13], mp[14], mp[15], mp[16], mp[17], mp[18], mp[19], mp[20], mp[21], mp[22], mp[23], mp[24], mp[25], mp[26], mp[27], mp[28], mp[29], mp[30], mp[31]);
    or operands_zero (op_zero, is_mc_zero, is_mp_zero);
    nor product_zero (prod_zero, product_right[0], product_right[1], product_right[2], product_right[3], product_right[4], product_right[5], product_right[6], product_right[7], product_right[8], product_right[9], product_right[10], product_right[11], product_right[12], product_right[13], product_right[14], product_right[15], product_right[16], product_right[17], product_right[18], product_right[19], product_right[20], product_right[21], product_right[22], product_right[23], product_right[24], product_right[25], product_right[26], product_right[27], product_right[28], product_right[29], product_right[30], product_right[31]);
    and zero (no_exception, op_zero, prod_zero);
    
    wire possible_exception;
    or or_exception (possible_exception, prod_sign, not_all, not_match);
    and (data_exception, possible_exception, ~no_exception);

endmodule