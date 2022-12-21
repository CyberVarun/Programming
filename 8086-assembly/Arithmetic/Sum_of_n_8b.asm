;Program to find the sum of 10 numbers
ASSUME CS:CODE DS:DATA

data segment
    a db 1,2,3,4,5,6,7,8,9,10
data ends                    

code segment

    start:
        mov ax,data
        mov ds,ax
        mov cl,10
        lea bx,a    ;bx=offset of a
        mov ah,00   ;ah=0
        mov al,00   ;al=0
        
    l1:
        add al,byte ptr[bx] ;al=al+a[bx]
        inc bx              ;bx=bx+1
        dec cl              ;cl=cl-1
        cmp cl,00           ;cl=0
        jnz l1              ;if cl!=0 goto l1
        mov ah,4ch          ;ah=4ch
        int 21h
        
code ends 

end start