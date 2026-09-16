# listing 3
.text

main:
    li x22,6 # i=6
    li x23,6 # j = 6 
    li x20,10 # g = 10
    li x21,4 # h = 4

    bne x22, x23, Else # if i is not equal to then go to ELSE
    add x19, x20, x21 # f = g+h
    beq x0, x0, Exit

    Else:
        sub x19, x20, x21 # f = g - h
    Exit:
    end:
        j end