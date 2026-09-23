.text
.globl main

main:
    addi x10, x0, 5          #x10=5 
    jal x1, ntri             #call
    # Result is now in x10 = 15=5+4+3+2+1
    j end
ntri:
    addi sp, sp, -8          #making 8 bytes of stack space
    sw x1, 4(sp)             #saving
    sw x10, 0(sp)          

    addi x5, x10, -1         #x5 =num-1
    bge x0, x5, base         #if num-1<=0, go to base case

    addi x10, x10, -1        #x10 =num-1
    jal x1, ntri             # recursively call ntri(num - 1)

    addi x5, x10, 0          # save ntri(num - 1) in x5
    lw x10, 0(sp)            #restoring
    lw x1, 4(sp)            
    addi sp, sp, 8            #remove current stack frame

    add x10, x10, x5         # x10=num+ ntri(num - 1)
    jalr x0, 0(x1)           # return result to caller


base:
    addi x10, x0, 1          #base case:return 1
    lw x1, 4(sp)             #restore return address
    addi sp, sp, 8           #remove current stack frame
    jalr x0, 0(x1)           #return to caller
end:
    j end