nop
nop
nop
nop
nop
lw $a0, 0x100   #memory location of h0
sw 0x6a09e667, 0($a0)      #initialize h0
sw 0xbb67ae85, 1($a0)      #initialize h1
sw 0x3c6ef372, 2($a0)      #initialize h2
sw 0x3c6ef372, 3($a0)      #initialize h3
sw 0x510e527f, 4($a0)      #initialize h4
sw 0x9b05688c, 5($a0)      #initialize h5
sw 0x1f83d9ab, 6($a0)      #initialize h6
sw 0x5be0cd19, 7($a0)      #initialize h7
lw $a0, 0x110   #memory location of k0
sw 0x428a2f98,  0($a0)      #initialize k
sw 0x71374491,  1($a0)      #initialize k 
sw 0xb5c0fbcf,  2($a0)      #initialize k 
sw 0xe9b5dba5,  3($a0)      #initialize k 
sw 0x3956c25b,  4($a0)      #initialize k 
sw 0x59f111f1,  5($a0)      #initialize k 
sw 0x923f82a4,  6($a0)      #initialize k 
sw 0xab1c5ed5,  7($a0)      #initialize k
sw 0xd807aa98,  8($a0)      #initialize k 
sw 0x12835b01,  9($a0)      #initialize k 
sw 0x243185be, 10($a0)      #initialize k 
sw 0x550c7dc3, 11($a0)      #initialize k 
sw 0x72be5d74, 12($a0)      #initialize k 
sw 0x80deb1fe, 13($a0)      #initialize k 
sw 0x9bdc06a7, 14($a0)      #initialize k 
sw 0xc19bf174, 15($a0)      #initialize k
sw 0xe49b69c1, 16($a0)      #initialize k 
sw 0xefbe4786, 17($a0)      #initialize k 
sw 0x0fc19dc6, 18($a0)      #initialize k 
sw 0x240ca1cc, 19($a0)      #initialize k 
sw 0x2de92c6f, 20($a0)      #initialize k 
sw 0x4a7484aa, 21($a0)      #initialize k 
sw 0x5cb0a9dc, 22($a0)      #initialize k 
sw 0x76f988da, 23($a0)      #initialize k
sw 0x983e5152, 24($a0)      #initialize k 
sw 0xa831c66d, 25($a0)      #initialize k 
sw 0xb00327c8, 26($a0)      #initialize k 
sw 0xbf597fc7, 27($a0)      #initialize k 
sw 0xc6e00bf3, 28($a0)      #initialize k 
sw 0xd5a79147, 29($a0)      #initialize k 
sw 0x06ca6351, 30($a0)      #initialize k 
sw 0x14292967, 31($a0)      #initialize k
sw 0x27b70a85, 32($a0)      #initialize k 
sw 0x2e1b2138, 33($a0)      #initialize k 
sw 0x4d2c6dfc, 34($a0)      #initialize k 
sw 0x53380d13, 35($a0)      #initialize k 
sw 0x650a7354, 36($a0)      #initialize k 
sw 0x766a0abb, 37($a0)      #initialize k 
sw 0x81c2c92e, 38($a0)      #initialize k 
sw 0x92722c85, 39($a0)      #initialize k
sw 0xa2bfe8a1, 40($a0)      #initialize k 
sw 0xa81a664b, 41($a0)      #initialize k 
sw 0xc24b8b70, 42($a0)      #initialize k 
sw 0xc76c51a3, 43($a0)      #initialize k 
sw 0xd192e819, 44($a0)      #initialize k 
sw 0xd6990624, 45($a0)      #initialize k 
sw 0xf40e3585, 46($a0)      #initialize k 
sw 0x106aa070, 47($a0)      #initialize k
sw 0x19a4c116, 48($a0)      #initialize k 
sw 0x1e376c08, 49($a0)      #initialize k 
sw 0x2748774c, 50($a0)      #initialize k 
sw 0x34b0bcb5, 51($a0)      #initialize k 
sw 0x391c0cb3, 52($a0)      #initialize k 
sw 0x4ed8aa4a, 53($a0)      #initialize k 
sw 0x5b9cca4f, 54($a0)      #initialize k 
sw 0x682e6ff3, 55($a0)      #initialize k
sw 0x748f82ee, 56($a0)      #initialize k 
sw 0x78a5636f, 57($a0)      #initialize k 
sw 0x84c87814, 58($a0)      #initialize k 
sw 0x8cc70208, 59($a0)      #initialize k 
sw 0x90befffa, 60($a0)      #initialize k 
sw 0xa4506ceb, 61($a0)      #initialize k 
sw 0xbef9a3f7, 62($a0)      #initialize k 
sw 0xc67178f2, 63($a0)      #initialize k
lw $a2, 0x250               # memory location of original message. assume maximum bit length is 256x32 bit in a 32bit system. next memory start with 0x250
sw 0x????????,  0($a2)      # initialize number of 16x32=512 bit words.
sw 0x????????,  1($a2)      # initialize input first 32bit word
sw 0x0, 0($t9)              # t9 = 0, for chunk process loop counter comparision
CHUNK_LOOP:         # for each chunk
lw $a1, 0x150       # memory address of w[0..63]
lw $t7, 0x16
mul $t7, $t7, $t9   # t7 = 16 * current number of chunk. an offset
lw $t6, 0x251       # original message.
add $a2, $t6,$t7    # a2 points to current chunk
lw $t8, 0           # loop counter of 16 words to copy message schedule array
INIT_W_LOOP1:
lw $t2,0($a2)       # 
sw $t2,0($a1)
addi $a2, $a2, 1
addi $a1, $a1, 1
addi $t8, $t8, 1
sw 16, $t7
blt $t7, $t8, INIT_W_LOOP1      # if 0 < t8, jump to INIT_W_LOOP1

lw $t8, 0           # loop counter of 16 words to copy message schedule array
INIT_W_LOOP2:
sw 0,0($a1)         # after first loop init, a1 now point to w[16..63], init all words to 0
addi $a1,$a1,1      # increase memory address
addi $t8,$t8,1      # count down loop counter
sw 48, $t7
blt $t7, $t8, INIT_W_LOOP2      # if 0 < t8, jump to INIT_W_LOOP2

#     Extend the first 16 words into the remaining 48 words w[16..63] of the message schedule array:
#     for i from 16 to 63
#         s0 := (w[i-15] rightrotate  7) xor (w[i-15] rightrotate 18) xor (w[i-15] rightshift  3)
#         s1 := (w[i- 2] rightrotate 17) xor (w[i- 2] rightrotate 19) xor (w[i- 2] rightshift 10)
#         w[i] := w[i-16] + s0 + w[i-7] + s1
# 
lw $t8, 0
EXTEND_LOOP:
lw $a0, 0x151       # w[i-15] when i=16
lw $a1, 0x15E       # w[i-2] when i=16
lw $a2, 0x150       # w[i-16] when i=16
lw $a3, 0x158       # w[i-7] when i=16

lw $t7, 0($a0)      # get w[i-15]
sra $t7, $t7,7      # right shift 7
lw $t6, 0($a0)      # get w[i-15]
sll $t6, $t6,25     # left shift 25
or $t7, $t7,$t6     # t7 = (w[i-15] rightrotate  7)

lw $t6, 0($a0)      # get w[i-15]
sra $t6, $t6,18     # right shift 18
lw $t5, 0($a0)      # get w[i-15]
sll $t5, $t5,14     # left shift 14
or $t6, $t6,$t5     # t6 = (w[i-15] rightrotate  18)

lw $t5, 0($a0)      # get w[i-15]
sra $t5, $t5,3      # right shift 3
lw $t4, 0($a0)      # get w[i-15]
sll $t4, $t4,29     # left shift 29
or $t5, $t5,$t4     # t5 = (w[i-15] rightrotate  3)

xor $t7, $t7, $t6
xor $t7, $t7, $t5   # t7 = s0

lw $t6, 0($a1)      # get w[i-2]
sra $t6, $t6,17      # right shift 17
lw $t5, 0($a1)      # get w[i-2]
sll $t5, $t5,15     # left shift 15
or $t6, $t6,$t5     # t7 = (w[i-2] rightrotate  17)

lw $t5, 0($a1)      # get w[i-2]
sra $t5, $t5,19     # right shift 19
lw $t4, 0($a1)      # get w[i-2]
sll $t4, $t4,13     # left shift 13
or $t5, $t5,$t4     # t6 = (w[i-2] rightrotate  19)

lw $t4, 0($a1)      # get w[i-2]
sra $t4, $t4,10      # right shift 10
lw $t3, 0($a1)      # get w[i-2]
sll $t3, $t3,22     # left shift 22
or $t4, $t4,$t3     # t5 = (w[i-2] rightrotate  10)

xor $t6, $t6, $t5
xor $t6, $t6, $t4   # t6 = s1

add $t7, $t7, $t6   # t7 = s0+s1
lw $t6, 0($a2)
add $t7, $t7, $t6   # t7 = s0 + s1 + w[i-16]
lw $t6, 0($a3)
add $t7, $t7, $t6   # t7 = s0 + s1 + w[i-16] + w[i-7]

addi $a0,$a0,1      # increase memory address
addi $a1,$a1,1      # increase memory address
addi $a2,$a2,1      # increase memory address
addi $a3,$a3,1      # increase memory address
addi $t8,$t8,1     # count down loop counter

sw 48, $t7
blt $t7,$t8,-45      # if 0 < t8, jump to EXTEND_LOOP

#     Initialize working variables to current hash value:
#     a := h0
#     b := h1
#     c := h2
#     d := h3
#     e := h4
#     f := h5
#     g := h6
#     h := h7
# 
lw $a0, 0x190       # memory for variable a, 0x301->b, 0x302->c, etc.
lw $a3, 0x100       # memory address for h0,...h7
lw $t7, 0($a3)
sw $t7, 0($a0)      # initialize variable a
lw $t7, 1($a3)
sw $t7, 1($a0)      # initialize variable b
lw $t7, 2($a3)
sw $t7, 2($a0)      # initialize variable c
lw $t7, 3($a3)
sw $t7, 3($a0)      # initialize variable d
lw $t7, 4($a3)
sw $t7, 4($a0)      # initialize variable e
lw $t7, 5($a3)
sw $t7, 5($a0)      # initialize variable f
lw $t7, 6($a3)
sw $t7, 6($a0)      # initialize variable g
lw $t7, 7($a3)
sw $t7, 7($a0)      # initialize variable h

#     Compression function main loop:
#     for i from 0 to 63
lw $t8, 0          # loop counter 64
COMPRESS_LOOP:
lw $a1, 0x110       # a1 point to k
lw $a2, 0x150       # a2 point to w

#         S1 := (e rightrotate 6) xor (e rightrotate 11) xor (e rightrotate 25)
lw $t7, 4($a0)      # load e
sra $t7, $t7, 6
lw $t6, 4($a0)
sll $t6, $t6, 26
or $t7, $t7, $t6    # t7 = (e rightrotate 6)

lw $t6, 4($a0)      # load e
sra $t6, $t6, 11
lw $t5, 4($a0)
sll $t5, $t5, 21
or $t6, $t6, $t5    # t6 = (e rightrotate 11)

lw $t5, 4($a0)      # load e
sra $t5, $t5, 11
lw $t4, 4($a0)
sll $t4, $t4, 21
or $t5, $t5, $t4    # t5 = (e rightrotate 11)

xor $t7, $t7, $t6
xor $t7, $t7, $t5   # t7 = s1

#         ch := (e and f) xor ((not e) and g)
lw $t6, 4($a0)
lw $t5, 5($a0)
and $t5, $t5, $t6   # t5 = (e and f)
lw $t4, 0xFFFFFFFF
sub $t6, $t4, $t6   # t6 = (not e)
lw $t4, 6($a0)
and $t6, $t6, $t4   # t6 = ((not e) and g)
xor $t6, $t6, $t5   # t6 = ch

#         temp1 := h + S1 + ch + k[i] + w[i]
add $t7, $t7, $t6   # t7 = temp1 = S1 + ch
lw $t6, 7($a0)
add $t7, $t7, $t6   # t7 = temp1 = h + S1 + ch 
lw $t6, ($a1)
add $t7, $t7, $t6   # t7 = temp1 = h + S1 + ch + k[i]
lw $t6, ($a2)
add $t0, $t7, $t6   #  t0 = temp1 = h + S1 + ch + k[i] + w[i]

#         S0 := (a rightrotate 2) xor (a rightrotate 13) xor (a rightrotate 22)
lw $t7, 0($a0)      # load a
sra $t7, $t7, 2
lw $t6, 0($a0)
sll $t6, $t6, 30
or $t7, $t7, $t6    # t7 = (a rightrotate 2)

lw $t6, 0($a0)      # load a
sra $t6, $t6, 13
lw $t5, 0($a0)
sll $t5, $t5, 19
or $t6, $t6, $t5    # t6 = (e rightrotate 13)

lw $t5, 0($a0)      # load a
sra $t5, $t5, 22
lw $t4, 0($a0)
sll $t4, $t4, 10
or $t5, $t5, $t4    # t5 = (e rightrotate 22)

xor $t7, $t7, $t6
xor $t7, $t7, $t5   # t7 = S0

#         maj := (a and b) xor (a and c) xor (b and c)
lw $t6, 0($a0)      # t6 = a
lw $t5, 1($a0)      # t5 = b
and $t5, $t5, $t6   # t5 = (a and b)
lw $t4, 2($a0)      # t4 = c
and $t6, $t6, $t4   # t6 = (a and c)
lw $t3, 1($a0)      # t3 = b
and $t4, $t4, $t3   # t4 = (b and c)
xor $t6, $t6, $t5   # t6 = maj := (a and b) xor (a and c)
xor $t6, $t6, $t4   # t6 = maj := (a and b) xor (a and c) xor (b and c)

#         temp2 := S0 + maj
add $t1, $t6, $t7   # t1 = temp2 := S0 + maj

#  
#         h := g
#         g := f
#         f := e
#         e := d + temp1
#         d := c
#         c := b
#         b := a
#         a := temp1 + temp2
lw $t7, 6($a0)      # t7 = g
sw $t7, 7($a0)      # h = g
lw $t7, 5($a0)      # t7 = f
sw $t7, 6($a0)      # g = f
lw $t7, 4($a0)      # t7 = e
sw $t7, 5($a0)      # f = e
lw $t7, 3($a0)      # t7 = d
add $t7, $t7, $t0   # t7 = d + temp1
sw $t7, 7($a0)      # e = d + temp1
lw $t7, 2($a0)      # t7 = c
sw $t7, 3($a0)      # d = c
lw $t7, 1($a0)      # t7 = b
sw $t7, 2($a0)      # c = b
lw $t7, 0($a0)      # t7 = a
sw $t7, 1($a0)      # b = a
add $t7, $t1, $t0   # t7 = temp1 + temp2
sw $t7, 7($a0)      # a = temp1 + temp2

addi $a1,$a1,1      # increase memory address
addi $a2,$a2,1      # increase memory address
addi $t8,$t8,1     # count down loop counter

sw 64, $t7
blt $t7,$t8,-80??      # if 0 < t8, jump to COMPRESS_LOOP

# 
#     Add the compressed chunk to the current hash value:
#     h0 := h0 + a
lw $t7, 0($a0)
lw $t6, 0($a3)
add $t7, $t7, $t6
sw $t7, 0($a0)

#     h1 := h1 + b
lw $t7, 1($a0)
lw $t6, 1($a3)
add $t7, $t7, $t6
sw $t7, 1($a0)

#     h2 := h2 + c
lw $t7, 2($a0)
lw $t6, 2($a3)
add $t7, $t7, $t6
sw $t7, 2($a0)

#     h3 := h3 + d
lw $t7, 3($a0)
lw $t6, 3($a3)
add $t7, $t7, $t6
sw $t7, 3($a0)

#     h4 := h4 + e
lw $t7, 4($a0)
lw $t6, 4($a3)
add $t7, $t7, $t6
sw $t7, 4($a0)

#     h5 := h5 + f
lw $t7, 5($a0)
lw $t6, 5($a3)
add $t7, $t7, $t6
sw $t7, 5($a0)

#     h6 := h6 + g
lw $t7, 6($a0)
lw $t6, 6($a3)
add $t7, $t7, $t6
sw $t7, 6($a0)

#     h7 := h7 + h
lw $t7, 7($a0)
lw $t6, 7($a3)
add $t7, $t7, $t6
sw $t7, 7($a0)

# 
# Produce the final hash value (big-endian):
# digest := hash := h0 append h1 append h2 append h3 append h4 append h5 append h6 append h7
lw $t7, 0x10        # t9 is the message chunk process loop counter, each loop has 16 32bit words.
mul $t7, $t7, $t9   # memory offset of next chunk of message
lw $t6, 0x500       # load absolute address of hash output
add $a2, $t7, $t6

lw $t7, 0($a3)
sw $t7, 0($a2)      # copy h0 out
lw $t7, 1($a3)
sw $t7, 1($a2)      # copy h1 out
lw $t7, 2($a3)
sw $t7, 2($a2)      # copy h2 out
lw $t7, 3($a3)
sw $t7, 3($a2)      # copy h3 out
lw $t7, 4($a3)
sw $t7, 4($a2)      # copy h4 out
lw $t7, 5($a3)
sw $t7, 5($a2)      # copy h5 out
lw $t7, 6($a3)
sw $t7, 6($a2)      # copy h6 out
lw $t7, 7($a3)
sw $t7, 7($a2)      # copy h7 out

# 
addi $t9, $t9, 1
lw $a2, 0x250
lw $t7, 0($a2)              # load number of chunk into t9 as loop counter
blt $t7, $t9, -100??        # if loop counter <= number of chunk, jump to CHUNK_LOOP


# end
