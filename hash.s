.data
input: .asciiz "hello world" // input

.text
main:
# rotate right -sll
# xor replaces -or

# hash instructions

# STEP 1
addi r1, 1 ; # add 1 into r1
sw r1, (input + 1)(r0) ; # store value in r1 (1) into place in memeory follwoing iinput