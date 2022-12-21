;Program to divide two numbers
ASSUME CS:CODE DS:DATA
data segment
    var1 dw 6827H
    var2 db 0feH
    quo db ?
    rem db ?
data ends          

code segment
    start: mov ax,data
           mov ds,ax
           
           mov ax,var1
           mov bl,var2
           
           div bl       ;divides var1 by var2   
           
           mov quo,al   ;quotient
           mov rem,ah   ;remainder
           mov ah,4ch
           int 21h
           code ends
end start