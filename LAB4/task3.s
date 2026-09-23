.text
.globl main

main:
    #array: {5,2,8,1,4}
    la x10,array #x10 = addr of array
    addi x11, x0, 5 # x11=length
    jal x1,bubble              #call bubble(a, len)
    #arr is now sorted in descending order {8,5,4,2,1}

    lw x12, 0(x10)             #x12=array[0] =8
    lw x13, 4(x10)             #x13=array[1] =5
    lw x14, 8(x10)             #x14=array[2] =4
    lw x15, 12(x10)            #x15=array[3] =2
    lw x16, 16(x10)            #x16 =array[4] =1
    jal x0, end
bubble:
    beq x10, x0,done            # if a == NULL, retur
    beq x11, x0,done            # if len == 0, return
    addi x5, x0,0               # i=0
outer_loop:
    bge x5, x11,done            # if i>=len, finish
    addi x6,x5, 0               # j = i
inner_loop:
    bge x6, x11, next_i          # if j>= len, go to next i
    #addr of a[i]
    slli x7, x5, 2               #x7 =i*4 (each int = 4 bytes)
    add x7, x10, x7              #x7 = add of a[i]
    lw x28, 0(x7)                #x28 = a[i]

    #addr of a[j]
    slli x29, x6, 2              # x29 = j *4
    add x29, x10, x29            # x29 = address of a[j]
    lw x30, 0(x29)               # x30 = a[j]
    bge x28, x30, no_swap         # if a[i] >= a[j], don't swap

    sw x30, 0(x7)                # a[i] = a[j] (swapping)
    sw x28, 0(x29)               # a[j] = old a[i]

no_swap:
    addi x6,x6, 1               # j++
    jal x0,inner_loop           # repeat inner loop

next_i:
    addi x5, x5,1               # i++
    jal x0,outer_loop           # repeat outer loop

done:
    jalr x0, 0(x1)             


end:
    jal x0, end
.data
array:
    .word 5, 2, 8, 1, 4          # test arr
