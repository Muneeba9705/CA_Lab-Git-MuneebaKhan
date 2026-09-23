#task1b iterative factorial
.text
.globl main
main:
    #calc 5!
    addi x10, x0, 5
    jal x1, fact
    jal x0, end
fact:
    addi x11, x0, 1
loop:
    bge x0, x10, done  # while (n > 0)
    mul x11, x11, x10 # acc =acc *n
    addi x10, x10, -1  # n =n -1
    jal x0, loop  #Repeat loop
done:
    addi x10, x11, 0   # Ret acc in x10
    jalr x0, 0(x1)
end:
    jal x0, end