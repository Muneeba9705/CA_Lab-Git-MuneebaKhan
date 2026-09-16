.text
.globl main

main:
    li x05, 5             # a = 5
    li x06, 2             # b = 2
    li x10, 0x340         # base addr of array D
    li x07, 0             # start i = 0

OuterLoop:
    bge x07, x05, OuterEnd    # stop:i >= a
    li x29, 0             # reset j to 0
InnerLoop:
    bge x29, x06, InnerEnd   # stop :j >=b
    slli x28, x29, 4      # offset = j* 16
    add x28, x28, x10     # calculate addr of D[4*j]
    add x27, x07, x29     # calculate i+j
    sw x27, 0(x28)        # store result in D[4*j]
    addi x29, x29, 1      # incr j
    beq x0, x0, InnerLoop # repeat innerloop
InnerEnd:
    addi x07, x07, 1      # incr i
    beq x0, x0, OuterLoop # repeat outerloop
OuterEnd:
end:
    j end