nop
nop
nop
nop
nop

# PRE PROCESSING
addi $r16, $r0, 1024   # memory location of original message
addi $r1, $r0, 13413   # load in "hello world" as input.
sll $r1, $r1, 16
addi $r2, $r0, 13932
or $r1, $r1, $r2
sw $r1, 0($r16)
addi $r1, $r0, 7136
sll $r1, $r1, 16
addi $r2, $r0, 15343
or $r1, $r1, $r2
sw $r1, 1($r16)
addi $r1, $r0, 14700
sll $r1, $r1, 16
addi $r2, $r0, 25728
or $r1, $r1, $r2
sw $r1, 2($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 3($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 4($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 5($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 6($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 7($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 8($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 9($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 10($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 11($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 12($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 13($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 0
or $r1, $r1, $r2
sw $r1, 14($r16)
addi $r1, $r0, 0
sll $r1, $r1, 16
addi $r2, $r0, 88
or $r1, $r1, $r2
sw $r1, 15($r16)

# INIT HASH VALUES
addi $r1, $r0, 0           # h = mem[0]
addi $r2, $r0, 27145
sll $r2, $r2, 16
addi $r2, $r2, 58983       # h0 = 0x6a09e667 = 110101000001001 1110011001100111
sw $r2, 0($r1)
addi $r2, $r0, -17561
sll $r2, $r2, 16
addi $r2, $r2, 44677       # h1 = 0xbb67ae85 = 1011101101100111 1010111010000101
sw $r2, 1($r1)
addi $r2, $r0, 15470
sll $r2, $r2, 16
addi $r2, $r2, 62322       # h2 = 0x3c6ef372 = 11110001101110 1111001101110010 
sw $r2, 2($r1)
addi $r2, $r0, -23217
sll $r2, $r2, 16
addi $r2, $r2, 62778       # h3 = 0xa54ff53a = 1010010101001111 1111010100111010
sw $r2, 3($r1)
addi $r2, $r0, 20750
sll $r2, $r2, 16
addi $r2, $r2, 21119       # h4 = 0x510e527f = 101000100001110 0101001001111111
sw $r2, 4($r1)
addi $r2, $r0, -25851
sll $r2, $r2, 16
addi $r2, $r2, 26764       # h5 = 0x9b05688c = 1001101100000101 0110100010001100 # FIX
sw $r2, 5($r1)
addi $r2, $r0, 8067
sll $r2, $r2, 16
addi $r2, $r2, 55723       # h6 = 0x1f83d9ab = 1111110000011 1101100110101011
sw $r2, 6($r1)
addi $r2, $r0, 23520
sll $r2, $r2, 16
addi $r2, $r2, 52505       # h7 = 0x5be0cd19 = 101101111100000 1100110100011001
sw $r2, 6($r1)

# INIT ARRAY OF ROUND CONSTANTS
addi $r16, $r0, 8          # initalize k; mem[k] = 8
addi $r1, $r0, 17034
sll $r1, $r1, 16
addi $r2, $r0, 12184       
or $r1, $r1, $r2
sw $r1, 0($r16)            # k[0] = 0x428a2f98
addi $r1, $r0, 28983
sll $r1, $r1, 16
addi $r2, $r0, 17553
or $r1, $r1, $r2
sw $r1, 1($r16)            # k[1] = 0x71374491
addi $r1, $r0, 46528
sll $r1, $r1, 16
addi $r2, $r0, 64463
or $r1, $r1, $r2
sw $r1, 2($r16)            # k[2] = 0xb5c0fbcf
addi $r1, $r0, 59829
sll $r1, $r1, 16
addi $r2, $r0, 56229
or $r1, $r1, $r2
sw $r1, 3($r16)            # k[3] = 0xe9b5dba5
addi $r1, $r0, 14678
sll $r1, $r1, 16
addi $r2, $r0, 49755
or $r1, $r1, $r2
sw $r1, 4($r16)            # k[4] = 0x3956c25b
addi $r1, $r0, 23025
sll $r1, $r1, 16
addi $r2, $r0, 4593
or $r1, $r1, $r2
sw $r1, 5($r16)            # k[5] = 0x59f111f1
addi $r1, $r0, 37439
sll $r1, $r1, 16
addi $r2, $r0, 33444
or $r1, $r1, $r2
sw $r1, 6($r16)            # k[6] = 0x923f82a4
addi $r1, $r0, 43804
sll $r1, $r1, 16
addi $r2, $r0, 24277
or $r1, $r1, $r2
sw $r1, 7($r16)            # k[7] = 0xab1c5ed5
addi $r1, $r0, 55303
sll $r1, $r1, 16
addi $r2, $r0, 43672
or $r1, $r1, $r2
sw $r1, 8($r16)            # k[8] = 0xd807aa98
addi $r1, $r0, 4739
sll $r1, $r1, 16
addi $r2, $r0, 23297
or $r1, $r1, $r2
sw $r1, 9($r16)            # k[9] = 0x12835b01
addi $r1, $r0, 9265
sll $r1, $r1, 16
addi $r2, $r0, 34238
or $r1, $r1, $r2
sw $r1, 10($r16)           # k[10] = 0x243185be
addi $r1, $r0, 21772
sll $r1, $r1, 16
addi $r2, $r0, 32195
or $r1, $r1, $r2
sw $r1, 11($r16)           # k[11] = 0x550c7dc3
addi $r1, $r0, 29374
sll $r1, $r1, 16
addi $r2, $r0, 23924
or $r1, $r1, $r2
sw $r1, 12($r16)           # k[12] = 0x72be5d74
addi $r1, $r0, 32990
sll $r1, $r1, 16
addi $r2, $r0, 45566
or $r1, $r1, $r2
sw $r1, 13($r16)           # k[13] = 0x80deb1fe
addi $r1, $r0, 39900
sll $r1, $r1, 16
addi $r2, $r0, 1703
or $r1, $r1, $r2
sw $r1, 14($r16)           # k[14] = 0x9bdc06a7
addi $r1, $r0, 49563
sll $r1, $r1, 16
addi $r2, $r0, 61812
or $r1, $r1, $r2
sw $r1, 15($r16)           # k[15] = 0xc19bf174
addi $r1, $r0, 58523
sll $r1, $r1, 16
addi $r2, $r0, 27073
or $r1, $r1, $r2
sw $r1, 16($r16)           # k[16] = 0xe49b69c1
addi $r1, $r0, 61374
sll $r1, $r1, 16
addi $r2, $r0, 18310
or $r1, $r1, $r2
sw $r1, 17($r16)           # k[17] = 0xefbe4786
addi $r1, $r0, 4033
sll $r1, $r1, 16
addi $r2, $r0, 40390
or $r1, $r1, $r2
sw $r1, 18($r16)           # k[18] = 0x0fc19dc6
addi $r1, $r0, 9228
sll $r1, $r1, 16
addi $r2, $r0, 41420
or $r1, $r1, $r2
sw $r1, 19($r16)           # k[19] = 0x240ca1cc
addi $r1, $r0, 11753
sll $r1, $r1, 16
addi $r2, $r0, 11375
or $r1, $r1, $r2
sw $r1, 20($r16)           # k[20] = 0x2de92c6f
addi $r1, $r0, 19060
sll $r1, $r1, 16
addi $r2, $r0, 33962
or $r1, $r1, $r2
sw $r1, 21($r16)           # k[21] = 0x4a7484aa
addi $r1, $r0, 23728
sll $r1, $r1, 16
addi $r2, $r0, 43484
or $r1, $r1, $r2
sw $r1, 22($r16)           # k[22] = 0x5cb0a9dc
addi $r1, $r0, 30457
sll $r1, $r1, 16
addi $r2, $r0, 35034
or $r1, $r1, $r2
sw $r1, 23($r16)           # k[23] = 0x76f988da
addi $r1, $r0, 38974
sll $r1, $r1, 16
addi $r2, $r0, 20818
or $r1, $r1, $r2
sw $r1, 24($r16)           # k[24] = 0x983e5152
addi $r1, $r0, 43057
sll $r1, $r1, 16
addi $r2, $r0, 50797
or $r1, $r1, $r2
sw $r1, 25($r16)           # k[25] = 0xa831c66d
addi $r1, $r0, 45059
sll $r1, $r1, 16
addi $r2, $r0, 10184
or $r1, $r1, $r2
sw $r1, 26($r16)           # k[26] = 0xb00327c8
addi $r1, $r0, 48985
sll $r1, $r1, 16
addi $r2, $r0, 32711
or $r1, $r1, $r2
sw $r1, 27($r16)           # k[27] = 0xbf597fc7
addi $r1, $r0, 50912
sll $r1, $r1, 16
addi $r2, $r0, 3059
or $r1, $r1, $r2
sw $r1, 28($r16)           # k[28] = 0xc6e00bf3
addi $r1, $r0, 54695
sll $r1, $r1, 16
addi $r2, $r0, 37191
or $r1, $r1, $r2
sw $r1, 29($r16)           # k[29] = 0xd5a79147
addi $r1, $r0, 1738
sll $r1, $r1, 16
addi $r2, $r0, 25425
or $r1, $r1, $r2
sw $r1, 30($r16)           # k[30] = 0x06ca6351
addi $r1, $r0, 5161
sll $r1, $r1, 16
addi $r2, $r0, 10599
or $r1, $r1, $r2
sw $r1, 31($r16)           # k[31] = 0x14292967
addi $r1, $r0, 10167
sll $r1, $r1, 16
addi $r2, $r0, 2693
or $r1, $r1, $r2
sw $r1, 32($r16)           # k[32] = 0x27b70a85
addi $r1, $r0, 11803
sll $r1, $r1, 16
addi $r2, $r0, 8504
or $r1, $r1, $r2
sw $r1, 33($r16)           # k[33] = 0x2e1b2138
addi $r1, $r0, 19756
sll $r1, $r1, 16
addi $r2, $r0, 28156
or $r1, $r1, $r2
sw $r1, 34($r16)           # k[34] = 0x4d2c6dfc
addi $r1, $r0, 21304
sll $r1, $r1, 16
addi $r2, $r0, 3347
or $r1, $r1, $r2
sw $r1, 35($r16)           # k[35] = 0x53380d13
addi $r1, $r0, 25866
sll $r1, $r1, 16
addi $r2, $r0, 29524
or $r1, $r1, $r2
sw $r1, 36($r16)           # k[36] = 0x650a7354
addi $r1, $r0, 30314
sll $r1, $r1, 16
addi $r2, $r0, 2747
or $r1, $r1, $r2
sw $r1, 37($r16)           # k[37] = 0x766a0abb
addi $r1, $r0, 33218
sll $r1, $r1, 16
addi $r2, $r0, 51502
or $r1, $r1, $r2
sw $r1, 38($r16)           # k[38] = 0x81c2c92e
addi $r1, $r0, 37490
sll $r1, $r1, 16
addi $r2, $r0, 11397
or $r1, $r1, $r2
sw $r1, 39($r16)           # k[39] = 0x92722c85
addi $r1, $r0, 41664
sll $r1, $r1, 16
addi $r2, $r0, 59553
or $r1, $r1, $r2
sw $r1, 40($r16)           # k[40] = 0xa2bfe8a1
addi $r1, $r0, 43034
sll $r1, $r1, 16
addi $r2, $r0, 26187
or $r1, $r1, $r2
sw $r1, 41($r16)           # k[41] = 0xa81a664b
addi $r1, $r0, 49739
sll $r1, $r1, 16
addi $r2, $r0, 35696
or $r1, $r1, $r2
sw $r1, 42($r16)           # k[42] = 0xc24b8b70
addi $r1, $r0, 51052
sll $r1, $r1, 16
addi $r2, $r0, 20899
or $r1, $r1, $r2
sw $r1, 43($r16)           # k[43] = 0xc76c51a3
addi $r1, $r0, 53650
sll $r1, $r1, 16
addi $r2, $r0, 59417
or $r1, $r1, $r2
sw $r1, 44($r16)           # k[44] = 0xd192e819
addi $r1, $r0, 54937
sll $r1, $r1, 16
addi $r2, $r0, 1572
or $r1, $r1, $r2
sw $r1, 45($r16)           # k[45] = 0xd6990624
addi $r1, $r0, 62478
sll $r1, $r1, 16
addi $r2, $r0, 13701
or $r1, $r1, $r2
sw $r1, 46($r16)           # k[46] = 0xf40e3585
addi $r1, $r0, 4202
sll $r1, $r1, 16
addi $r2, $r0, 41072
or $r1, $r1, $r2
sw $r1, 47($r16)           # k[47] = 0x106aa070
addi $r1, $r0, 6564
sll $r1, $r1, 16
addi $r2, $r0, 49430
or $r1, $r1, $r2
sw $r1, 48($r16)           # k[48] = 0x19a4c116
addi $r1, $r0, 7735
sll $r1, $r1, 16
addi $r2, $r0, 27656
or $r1, $r1, $r2
sw $r1, 49($r16)           # k[49] = 0x1e376c08
addi $r1, $r0, 10056
sll $r1, $r1, 16
addi $r2, $r0, 30540
or $r1, $r1, $r2
sw $r1, 50($r16)           # k[50] = 0x2748774c
addi $r1, $r0, 13488
sll $r1, $r1, 16
addi $r2, $r0, 48309
or $r1, $r1, $r2
sw $r1, 51($r16)           # k[51] = 0x34b0bcb5
addi $r1, $r0, 14620
sll $r1, $r1, 16
addi $r2, $r0, 3251
or $r1, $r1, $r2
sw $r1, 52($r16)           # k[52] = 0x391c0cb3
addi $r1, $r0, 20184
sll $r1, $r1, 16
addi $r2, $r0, 43594
or $r1, $r1, $r2
sw $r1, 53($r16)           # k[53] = 0x4ed8aa4a
addi $r1, $r0, 23452
sll $r1, $r1, 16
addi $r2, $r0, 51791
or $r1, $r1, $r2
sw $r1, 54($r16)           # k[54] = 0x5b9cca4f
addi $r1, $r0, 26670
sll $r1, $r1, 16
addi $r2, $r0, 28659
or $r1, $r1, $r2
sw $r1, 55($r16)           # k[55] = 0x682e6ff3
addi $r1, $r0, 29839
sll $r1, $r1, 16
addi $r2, $r0, 33518
or $r1, $r1, $r2
sw $r1, 56($r16)           # k[56] = 0x748f82ee
addi $r1, $r0, 30885
sll $r1, $r1, 16
addi $r2, $r0, 25455
or $r1, $r1, $r2
sw $r1, 57($r16)           # k[57] = 0x78a5636f
addi $r1, $r0, 33992
sll $r1, $r1, 16
addi $r2, $r0, 30740
or $r1, $r1, $r2
sw $r1, 58($r16)           # k[58] = 0x84c87814
addi $r1, $r0, 36039
sll $r1, $r1, 16
addi $r2, $r0, 520
or $r1, $r1, $r2
sw $r1, 59($r16)           # k[59] = 0x8cc70208
addi $r1, $r0, 37054
sll $r1, $r1, 16
addi $r2, $r0, 65530
or $r1, $r1, $r2
sw $r1, 60($r16)           # k[60] = 0x90befffa
addi $r1, $r0, 42064
sll $r1, $r1, 16
addi $r2, $r0, 27883
or $r1, $r1, $r2
sw $r1, 61($r16)           # k[61] = 0xa4506ceb
addi $r1, $r0, 48889
sll $r1, $r1, 16
addi $r2, $r0, 41975
or $r1, $r1, $r2
sw $r1, 62($r16)           # k[62] = 0xbef9a3f7
addi $r1, $r0, 50801
sll $r1, $r1, 16
addi $r2, $r0, 30962
or $r1, $r1, $r2
sw $r1, 63($r16)           # k[63] = 0xc67178f2

# PROCESS
CHUNK_LOOP:
addi $r16, $r0, 72               # MEM[72] = w[0..63]
addi $r17, $r0, 1024             # MEM[1024] = input

addi $r25, $r0, 0                # r25: loop counter for INIT_W_LOOP1
INIT_W_LOOP1:                    # copy input into w[0...15]
lw $r6, 0($r17)
sw $r6, 0($r16)
addi $r17, $r17, 1
addi $r16, $r16, 1
addi $r25, $r25, 1
addi $r1, $r0, 16                # r1 = 16
blt $r25, $r1, INIT_W_LOOP1      # if r25 < 16, jump to INIT_W_LOOP1

lw $r25, $r0                     # r25: loop counter for INIT_W_LOOP2
INIT_W_LOOP2:                    # initalize w[16...63] to 0
sw $r0, 0($r16)                  # after first loop init, r16 now point to w[16..63], init all words to 0
addi $r16, $r16, 1
addi $r25, $r25, 1
addi $r1, $r0, 48
blt $r25, $r1, INIT_W_LOOP2      # if r25 < 48, jump to INIT_W_LOOP2

addi $r25, $r0, 0     # r25: loop counter for extend_loop
addi $r18, $r0, 72    # w address from 72 to 135
EXTEND_LOOP:          # extend w[0...15] into w[16..63] of the message schedule array for i from 16 to 63
lw r15, 1($r18)       # w[i-15]
rotr r1, r15, 7     
rotr r2, r15, 18
rotr r3, r15, 3
xor $r1, $r1, $r2
xor $r1, $r1, $r3     # r1 = s0
lw r15, 14($r18)      # w[i-2]
rotr r2, r15, 17   
rotr r3, r15, 19
rotr r4, r15, 10
xor $r2, $r2, $r3
xor $r2, $r2, $r4     # r2 = s1
add $r1, $r1, $r2     # r1 = s0 + s1
lw $r2, 0($r18)
add $r1, $r1, $r2     # r1 = s0 + s1 + w[i-16]
lw $r2, 9($r18)
add $r1, $r1, $r2     # r1 = s0 + s1 + w[i-16] + w[i-7]
addi $r18, $r18, 1
addi $r25, $r25, 1
addi $r1, $r0, 48
blt  $r25, $r1, EXTEND_LOOP      # if r25 < 48, jump to EXTEND_LOOP

addi $r18, $r0, 136     # intialize working variables to current hash value at MEM[136]
addi $r19, $r0, 0       # memory address for h0,...h7
lw $r1, 0($r19)
sw $r1, 0($r18)         # initialize variable a
lw $r1, 1($r19)
sw $r1, 1($r18)         # initialize variable b
lw $r1, 2($r19)
sw $r1, 2($r18)         # initialize variable c
lw $r1, 3($r19)
sw $r1, 3($r18)         # initialize variable d
lw $r1, 4($r19)  
sw $r1, 4($r18)         # initialize variable e
lw $r1, 5($r19)
sw $r1, 5($r18)         # initialize variable f
lw $r1, 6($r19)
sw $r1, 6($r18)         # initialize variable g
lw $r1, 7($r19)
sw $r1, 7($r18)         # initialize variable h

# compression function main loop for i from 0 to 63
addi $r25, $r0, 0       # r25: loop counter for COMPRESS_LOOP
addi $r16, $r0, 8       # r16: address of k
addi $r17, $r0, 72      # r17: address of w
COMPRESS_LOOP:
# s1
lw $r15, 4($r18)      # load e
rotr $r1, $r15, 6     # r1 = (e rightrotate 6)
rotr $r2, $r15, 11    # r2 = (e rightrotate 11)
rotr $r3, $r15, 25    # r3 = (e rightrotate 25)
xor $r1, $r1, $r2
xor $r1, $r1, $r3     # r1 = s1 = (e rightrotate 6) xor (e rightrotate 11) xor (e rightrotate 25)
# ch
lw $r2, 4($r18)       # r2 = e
lw $r3, 5($r18)       # r3 = f
and $r3, $r3, $r2     # r3 = (e and f)
addi $r4, $r0, 65535  # 0xFFFFFFFF
sll $r4, $r4, 16
addi $r4, $r0, 65535 
sub $r2, $r4, $r2     # r2 = (not e)
lw $r4, 6($r18)
and $r2, $r2, $r4     # r2 = ((not e) and g)
xor $r2, $r2, $r3     # r2 = ch = (e and f) xor ((not e) and g)
# temp1
add $r1, $r1, $r2     # r1 = temp1 = S1 + ch
lw $r2, 7($r18)
add $r1, $r1, $r2     # r1 = temp1 = h + S1 + ch 
lw $r2, 0($r16)
add $r1, $r1, $r2     # r1 = temp1 = h + S1 + ch + k[i]
lw $r2, 0($r17)
add $r8, $r1, $r2     # r8 = temp1 = h + S1 + ch + k[i] + w[i]
# s0
lw $r15, 0($r18)      # r15 = a
rotr $r1, $r15, 2     # r1 = a rightrotate 2
rotr $r2, $r15, 13    # r2 = a rightrotate 13
rotr $r3, $r15, 22    # r3 = a rightrotate 22
xor $r1, $r1, $r2
xor $r1, $r1, $r3     # r1 = S0 = (a rightrotate 2) xor (a rightrotate 13) xor (a rightrotate 22)
# maj
lw $r2, 0($r18)       # r2 = a
lw $r3, 1($r18)       # r3 = b
and $r3, $r3, $r2     # r3 = (a and b)
lw $r4, 2($r18)       # r4 = c
and $r2, $r2, $r4     # r2 = (a and c)
lw $r5, 1($r18)       # r5 = b
and $r4, $r4, $r5     # r4 = (b and c)
xor $r2, $r2, $r3     # r2 = maj = (a and b) xor (a and c)
xor $r2, $r2, $r4     # r2 = maj = (a and b) xor (a and c) xor (b and c)
# temp2
add $r7, $r2, $r1   # r7 = temp2 = S0 + maj

lw $r1, 6($r18)                # r1 = g
sw $r1, 7($r18)      # h := g
lw $r1, 5($r18)                # r1 = f
sw $r1, 6($r18)      # g := f
lw $r1, 4($r18)                # r1 = e
sw $r1, 5($r18)      # f := e
lw $r1, 3($r18)                # r1 = d
add $r1, $r1, $r8              # r1 = d + temp1
sw $r1, 7($r18)      # e := d + temp1
lw $r1, 2($r18)                # r1 = c
sw $r1, 3($r18)      # d := c
lw $r1, 1($r18)                # r1 = b
sw $r1, 2($r18)      # c := b
lw $r1, 0($r18)                # r1 = a
sw $r1, 1($r18)      # b := a
add $r1, $r7, $r8              # r1 = temp1 + temp2
sw $r1, 7($r18)      # a := temp1 + temp2

addi $r16, $r16, 1   # increase memory address
addi $r17, $r17, 1   # increase memory address
addi $r25, $r25, 1   # increase loop counter

addi $r1, $r0, 64
blt $r25, $r1, COMPRESS_LOOP   # if r25 < 64, jump to COMPRESS_LOOP

# add compressed chunk to the current hash value:
lw $r1, 0($r18)
lw $r2, 0($r19)
add $r1, $r1, $r2
sw $r1, 0($r18)     # h0 := h0 + a

lw $r1, 1($r18)
lw $r2, 1($r19)
add $r1, $r1, $r2
sw $r1, 1($r18)     # h1 := h1 + b

lw $r1, 2($r18)
lw $r2, 2($r19)
add $r1, $r1, $r2
sw $r1, 2($r18)     # h2 := h2 + c

lw $r1, 3($r18)
lw $r2, 3($r19)
add $r1, $r1, $r2
sw $r1, 3($r18)     # h3 := h3 + d

lw $r1, 4($r18)
lw $r2, 4($r19)
add $r1, $r1, $r2
sw $r1, 4($r18)     # h4 := h4 + e

lw $r1, 5($r18)
lw $r2, 5($r19)
add $r1, $r1, $r2
sw $r1, 5($r18)     # h5 := h5 + f

lw $r1, 6($r18)
lw $r2, 6($r19)
add $r1, $r1, $r2
sw $r1, 6($r18)     # h6 := h6 + g

lw $r1, 7($r18)
lw $r2, 7($r19)
add $r1, $r1, $r2
sw $r1, 7($r18)     # h7 := h7 + h

# Produce the final hash value (big-endian):
# digest := hash := h0 append h1 append h2 append h3 append h4 append h5 append h6 append h7
addi $r17, $r0, 8192       # load absolute address of hash output

lw $r1, 0($r19)
sw $r1, 0($r17)      # copy h0 out
lw $r1, 1($r19)
sw $r1, 1($r17)      # copy h1 out
lw $r1, 2($r19)
sw $r1, 2($r17)      # copy h2 out
lw $r1, 3($r19)
sw $r1, 3($r17)      # copy h3 out
lw $r1, 4($r19)
sw $r1, 4($r17)      # copy h4 out
lw $r1, 5($r19)
sw $r1, 5($r17)      # copy h5 out
lw $r1, 6($r19)
sw $r1, 6($r17)      # copy h6 out
lw $r1, 7($r19)
sw $r1, 7($r17)      # copy h7 out

