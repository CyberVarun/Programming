;Program to compare two strings

ASSUME CS:CODE DS:DATA

data SEGMENT
p_str1 DB Cr, Lf, 'Enter 1st string: ',0 				;
p_str2 DB Cr, Lf, 'Enter 2nd string: ',0  			;
p_not DB Cr, Lf, 'The strings are not same',0
p_same DB Cr, Lf, 'The strings are the same',0
str1 DB 100 DUP (?)
str2 DB 100 DUP (?)
data ENDS

code SEGMENT

start:	mov ax, data
	mov ds, ax ;input str1
	output p_str1
	inputs str1, 100 ;input str2
	output p_str2
	inputs str2, 100 ;initialize
	lea si, str1	 ;use string instructions to comapre the two strings
	lea di, str2   ;use string instructions to comapre the two strings
	cld						;clear direction flags
	repe cmpsb	  ;repeat compare string byte
	je p_same			;jump if equal
	jmp p_not			;jump if not equal

l_not:	output p_not 	;output not same
	jmp quit						;quit
l_same:	output p_same ;output same

quit:	mov al, 00h     ;quit
	mov ah, 4ch
	int 21h
code ENDS
END start
