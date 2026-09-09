.text
main: 
    li x1, 0x100   #a(char)
    li x2, 0x200   #b(short)
    li x3, 0x300   #c (int)

    # i=0
    lb x20, 0(x1)   #load a[0]
    lh x21, 0(x2)   #load b[0]
    add x22, x20, x21 #c[0] = a[0] + b[0]
    sw x22, 0(x3)   #store c[0]

    # i=1
    lb x20, 1(x1)   #load a[1]
    lh x21, 2(x2)   #load b[1]
    add x22, x20, x21 #c[1] = a[1] + b[1]
    sw x22, 4(x3)   #store c[1]

    # i=2
    lb x20, 2(x1)   #load a[2]
    lh x21, 4(x2)   #load b[2]  
    add x22, x20, x21 #c[2] = a[2] + b[2]
    sw x22, 8(x3)   #store c[2]

    # i=3
    lb x20, 3(x1)   #load a[3]
    lh x21, 6(x2)   #load b[3]
    add x22, x20, x21 #c[3] = a[3] + b[3]
    sw x22, 12(x3)   #store c[3]

    j end
end:
    j end # infinite loop to halt the program