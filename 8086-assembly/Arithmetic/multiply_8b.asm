;Program to multiply two 32bit numbers
ASSUME CS:CODE DS:DATA
data segment
    var1 db 0EDH
    var2 db 99H
    res dw ?
data ends          

code segment
    start: mov ax,data
           mov ds,ax
           
           mov al,var1
           mov bl,var2
           mul bl       ;al=var1*var2
           mov res,ax   ;res=var1*var2
           mov ah,4ch
           int 21h
           code ends
end start