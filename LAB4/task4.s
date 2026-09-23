.text
.globl main
main:
    addi x10, x0, 48          #first num
    addi x11, x0, 18          #2nd num
    jal x1, gcd               # call gcd(48,18)
    # addi x12, x10, 0
    #result is 6
    jal x0, end               
gcd:
    addi sp, sp, -8           #allocating space 
    sw x1, 4(sp)              #save return addr
    sw x11, 0(sp)             #save second numb

gcd_loop:
    beq x11, x0, gcd_done     # if 2nd numb == 0, finish
    jal x1, remainder         #call remainder(a, b)

    lw x11, 0(sp)             # restore old 2nd numb
    addi x12, x10, 0           #x12=remainder

    addi x10, x11, 0           #x10 = old second number
    addi x11, x12, 0           #x11 = remainder

    sw x11, 0(sp)             #save new second number
    jal x0, gcd_loop           #repeat
gcd_done:
    lw x1, 4(sp)              # restore return address
    addi sp, sp, 8            # remove stack space
    jalr x0, 0(x1)            # return to main

remainder:
    rem x10, x10, x11         # x10=x10 % x11
    jalr x0, 0(x1)            # return to gcd
end:
    jal x0, end             