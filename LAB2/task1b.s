.text
.globl main

main:
    li x22, 0              # i =0
    li x24, 3              # k =3
    li x25, 0x100          # Base address of save array

    #initialize save[] =[3,3, 5,3]
    li x9, 3
    sw x9, 0(x25)          # save[0] = 3
    sw x9, 4(x25)          # save[1] = 3
    li x9, 5
    sw x9, 8(x25)          #save[2] = 5
    li x9, 3
    sw x9, 12(x25)         #save[3] = 3
Loop:
    slli x10, x22, 2       # x10=i * 4
    add x10, x10, x25      # x10=address of save[i]
    lw x9, 0(x10)          # x9 =save[i]

    bne x9, x24, Exit      # if save[i] != k, leave loop

    addi x22, x22, 1       # i = i + 1
    beq x0, x0, Loop       # unconditional jump back to Loop

Exit:
end:
    j end                 