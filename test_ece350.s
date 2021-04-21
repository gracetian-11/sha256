nop
nop
nop
nop
nop
addi $r1, $r0, 25955   # ec
sll $r1, $r1, 16
addi $r1, $r1, 25907   # e3
addi $r2, $r0, 13616   # 50
sll $r2, $r2, 16
addi $r2, $r2, 32768   # append 1
sw $r1, 200($0)        # ece350 stored at mem[200]
sw $r2, 201($0)
# TODO: append length
# addi $r1, $r0,             # big-endian integer representing length of original input in binary
# sw $r1, 215($0)            # append length
#####################
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
nop
CHUNK_LOOP:
addi $r16, $r0, 72         # memory address of w[0..63]
addi $r1, $r0, 16
mul $r1, $r1, $r24         # r1 = 16 * current number of chunk. an offset
addi $r2, $r0, 200         # address of input
add $r17, $r2, $r1         # r17: current chunk
addi $r25, $r0, 0          # loop counter of 16 words to copy message schedule array
INIT_W_LOOP1:
lw $r6, 0($r17)
sw $r6, 0($r16)
addi $r17,$r17,1
addi $r16,$r16,1
addi $r25,$r25,1
addi $r1, $r0, 16
blt $r1,$r25,-6      # if 0 < r25, jump to INIT_W_LOOP1


addi $r1, $r0, 16    # loop counter
MESSAGE_SCHEDULE_LOOP:
addi $r2, $r1, -15  # i-15
