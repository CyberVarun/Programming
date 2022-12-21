;ALP for conversion of 16-bit BCD number into its equivalent HEX number.
ASSUME CS:CODE,DS:DATA

DATA SEGMENT
    BCD DB 06H,05H,05H,03H,05H
    HEX DW ?
DATA ENDS

CODE SEGMENT
START: MOV AX,DATA
       MOV DS,AX
       MOV CL,05H
       MOV BP,000AH
       MOV AX,2710H
       PUSH AX              ;AX=2710H
       MOV DI,0000H
       MOV SI, OFFSET BCD   ;SI points to BCD
       
       X:
       MOV BL,[SI]          ;BL=BCD
       MUL BX               ;AX=BCD*BCD
       ADD DI,AX            ;DI=HEX
       POP AX               ;AX=2710H
       DIV BP               ;AX=HEX/10
       PUSH AX              ;AX=HEX/10
       INC SI               ;SI=SI+1
       LOOP X               ;LOOP 5 times
       MOV HEX,DI           ;HEX=DI
       
       MOV AH,4CH
       INT 21H
CODE ENDS
END START