.text
.global main

main:  
    li x5 , 5 # a =x5= 5 
    addi x6, x0, 0  # b = x6 = 0 + 0 
     
    addi x5, x6,32 
 
    add x7 , x5, x6 # x7 = a+b 
    addi x8, x7, -5 # x8 = d = (a+b) - 5 
    sub x9 , x5 , x8 # x9 = a - d 
    sub x10, x6, x5 # x10 = b-a 
    add x11, x9, x10 # x11 = (a-d) + (b-a) 
    add x12, x11, x8 # x12 = e = (a-d) + (b-a) + d 
 
    add x13, x5, x6 # x13 = a + b 
    add x14, x8 , x12 # x14 = d + e 
    add x12, x13, x14 # x12 = (a+b) + (d+e) 
 
end: 
    j end # infinite loop to halt the program 