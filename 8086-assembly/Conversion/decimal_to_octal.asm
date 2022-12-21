;Code for Program to Convert Decimal number to Octal number in Assembly Language
ASSUME CS:CODE DS:DATA
prnstr macro msg
        mov ah, 09h
        lea dx, msg
        int 21h
        endm

data segment
        buf1 db "Enter a decimal number : $"            ;prompt for input
        buf2 db 0ah, "Invalid Decimal Number...$"       ;error message
        buf3 db 0ah, "Equivalent octal number is : $"   ;output message
        buf4 db 6                                       ;buffer for input
             db 0                                       
             db 6 dup(0)                                ;buffer for output
        multiplier db 0ah                               ;multiplier
data ends

code segment
start :
        mov ax, data
        mov ds, ax
        mov es, ax

        prnstr buf1             ;prompt for input

        mov ah, 0ah
        lea dx, buf4
        int 21h                  ;input the number

        mov si, offset buf4 + 2  ;si points to the first digit
        mov cl, byte ptr [si-1]  ;cl contains the number of digits
        mov ch, 00h
subtract :
        mov al, byte ptr [si]    ;al contains the digit
        cmp al, 30h
        jnb cont1               ;if digit is not less than 0
        prnstr buf2             ;then print error message
        jmp stop
cont1 :
        cmp al, 3ah             ;if digit is greater than 9
        jb cont2                ;then continue
        prnstr buf2             ;else print error message
        jmp stop                ;and stop
cont2 :
        sub al, 30h
        mov byte ptr [si], al   ;store the digit in al

        inc si                  ;increment si
        loop subtract           ;loop until all digits are checked

        mov si, offset buf4 + 2 ;si points to the first digit
        mov cl, byte ptr [si-1] ;cl contains the number of digits
        mov ch, 00h
        mov ax, 0000h
calc :
        mul multiplier
        mov bl, byte ptr [si]   ;bl contains the digit
        mov bh, 00h
        add ax, bx
        inc si
        loop calc

        mov si, offset buf4 + 2 ;si points to the first digit
        mov bx, ax
        mov dx, 0000h
        mov ax, 8000h
convert :
        mov cx, 0000h
conv :
        cmp bx, ax
        jb cont3               ;if bx is less than ax
        sub bx, ax
        inc cx
        jmp conv                ;else increment cx and continue
cont3 :
        add cl, 30h
        mov byte ptr [si], cl   ;store the digit in cl
        inc si
        mov cx, 0008h
        div cx
        cmp ax, 0000h
        jnz convert

        mov byte ptr [si], '$'  ;add '$' at the end
        prnstr buf3             ;print the message
        prnstr buf4+2           ;print the octal number
stop :
        mov ax, 4c00h
        int 21h
code ends
        end start
