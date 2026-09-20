# Task 4
.text
.globl main

main:
    li x10, 0x120        # base addr of x[]
    li x11, 0x220        # base addr of y[]
    li x12, 'C'
    sb x12, 0(x11)       #y[0] = 'C'
    li x12, 'A'
    sb x12, 1(x11)       # y[1]='A'
    li x12, 'T'
    sb x12, 2(x11)       # y[2] = 'T'
    sb x0, 3(x11)        #y[3] = '\0'
    jal x1, strcpy      

    j exit

strcpy:
    addi sp, sp, -16     # allocate stack space
    sw x19, 0(sp)        # save x19

    li x19, 0            # i = 0

Loop:
    add x13, x11, x19    # x13= addr of y[i]
    lbu x14, 0(x13)      # x14=y[i]

    add x15, x10, x19    # x15 =addr of x[i]
    sb x14, 0(x15)       #x[i]= y[i]

    beq x14, x0, Done    #if y[i]== '\0', exit

    addi x19, x19, 1     # i=i+1
    beq x0, x0, Loop     # repeat loop

Done:
    lw x19, 0(sp)        # restore x19
    addi sp, sp, 16      # release stack space
    jalr x0, 0(x1)      

exit:
end:
    j end               