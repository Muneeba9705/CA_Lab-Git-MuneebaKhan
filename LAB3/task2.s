.text
# g = x10 
# h = x11
# i = x12
# j = x13

main:
    li sp, 0x200
    li x10, 6
    li x11, 7
    li x12, 8
    li x13, 9

    jal x1, leaf_example
    addi x11, x10, 0
    li x10, 1
    ecall
    j exit


    leaf_example:
        addi sp, sp, -12

        sw x18, 0(sp)
        sw x19, 4(sp) 
        sw x20, 8(sp)

        add x18, x10, x11
        add x19, x12, x13
        sub x20, x18, x19

        add x10, x20, x0

        lw x18, 0(sp)
        lw x19, 4(sp)
        lw x20, 8(sp)
        addi sp, sp, 12

        jalr x0 , 0(x1)

    exit:
    end:
        j end   


