.text
# g = x10 
# h = x11
# i = x12
# j = x13

main:
    li sp, 0x200   #initialize stack pointer
    li x10, 6 # g=6
    li x11, 7 # h= 7
    li x12, 8 # i = 8
    li x13, 9 # j = 9

    jal x1, leaf_example # calling
    addi x11, x10, 0 #moving result to x11 for printing
    li x10, 1
    ecall
    j exit


    leaf_example:
        addi sp, sp, -12 #allocate 12 bytes on stack

        sw x18, 0(sp) #saving
        sw x19, 4(sp) 
        sw x20, 8(sp)

        add x18, x10, x11 #x18= g+h
        add x19, x12, x13 # x19 = i+j
        sub x20, x18, x19 #x20 =(g+h) - (i+j)
        add x10, x20, x0 # return result in x10

        lw x18, 0(sp) #restoring
        lw x19, 4(sp)
        lw x20, 8(sp)
        addi sp, sp, 12 #releasing stack space

        jalr x0 , 0(x1) #return to main

    exit:
    end: #stop
        j end   


