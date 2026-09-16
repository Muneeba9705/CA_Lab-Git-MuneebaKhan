.text
main:
    li x25, 0x240         # base addr of array a
    # for (i=0; i<10; i++) a[i] = i;
    li x22, 0             #start i= 0
Loop1:
    li x24, 10            #looplimit
    bge x22, x24, End1    # stop when i >= 10
    slli x26, x22, 2      # calculate i * 4
    add x27, x25, x26     #addr of a[i]
    sw x22, 0(x27)        # store i in a[i]
    addi x22, x22, 1      # incr i
    beq x0, x0, Loop1     # repeat loop
End1:
    # for (i=0; i<10; i++) sum+= a[i];
    li x22, 0             # reset i
    li x23, 0             # start sum from 0
Loop2:
    li x24, 10            # limit
    bge x22, x24, End2    # stop i >= 10
    slli x26, x22, 2      # calculate i*4
    add x27, x25, x26     # get address of a[i]
    lw x28, 0(x27)        # load a[i]
    add x23, x23, x28     # add a[i] to sum
    addi x22, x22, 1      # incr i
    beq x0, x0, Loop2     # repeat
End2:
end:
    j end