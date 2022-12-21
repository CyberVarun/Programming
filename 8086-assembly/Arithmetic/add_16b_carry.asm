;Program to add two 16 bit numbers and check for carry
ASSUME CS:CODE DS:DATA
data segment
    var1 dw 1234h
    var2 dw 5140h
    result dw ?
    carry db 00h
data ends

code segment    
    mov ax,data
    mov ds,ax
   
start: mov ax,var1
       add ax,var2
       jnc skip        ;jump if no carry
       mov carry,01h   ;set carry flag

skip: mov result,ax    ;store result
       mov ax,4c00h

      int 03h

end start
code ends
end