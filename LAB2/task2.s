# x  =x20
# a  =x21
# b  =x22
# c  =x23

# Assign suitable values
addi x20, x0, 1        # x= 3
addi x22, x0, 10       # b = 10
addi x23, x0, 4        # c = 4

#case 1
addi x5, x0, 1
beq  x20, x5, Case1

#case 2
addi x5, x0, 2
beq  x20, x5, Case2

#case 3
addi x5, x0, 3
beq  x20, x5, Case3

# Check case 4
addi x5, x0, 4
beq  x20, x5, Case4


beq  x0, x0, Default #none matched


Case1:
    add x21, x22, x23       #a =b + c
    beq x0, x0, Exit        # break

Case2:
    sub x21, x22, x23       #a =b - c
    beq x0, x0,Exit        # break

Case3:
    slli x21, x22, 1        #a= b * 2
    beq x0, x0,Exit        # break

Case4:
    addi x5, x0,2
    div  x21,x22,x5       # a =b / 2
    beq  x0, x0, Exit       # break

Default:
    addi x21, x0, 0         #a =0

Exit: