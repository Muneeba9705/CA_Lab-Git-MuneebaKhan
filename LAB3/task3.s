# Task 3
.text
.globl main

main:
    li x10, 0x240        # base address of array v
    li x11, 1            # k=1

    # Initialize array v
    li x12, 15
    sw x12, 0(x10)       # v[0]=15

    li x12, 25
    sw x12, 4(x10)       # v[1]=25

    li x12, 35
    sw x12, 8(x10)       # v[2]=35

    li x12, 45
    sw x12, 12(x10)      # v[3]=45

    jal x1, swap         # calling swap func

    j exit

swap:
    slli x13, x11, 2     # x13=k*4
    add x13, x13, x10    # x13 =address of v[k]

    lw x14, 0(x13)       # x14 =v[k]
    lw x15, 4(x13)       # x15 =v[k+1]

    sw x15, 0(x13)       # v[k] =v[k+1]
    sw x14, 4(x13)       # v[k+1]= old v[k]

    jalr x0, 0(x1)       # return main

exit:
end:
    j end             