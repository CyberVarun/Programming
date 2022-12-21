;Code for Program to convert decimal number to binary in Assembly Language

ASSUME DS:DATA,CS:CODE ; Assume DS as data segment and CS as code segment

DIS MACRO STR           ; Macro to display string
MOV AH,09H              ; Function number for printing string
LEA DX,STR              ; Load address of string to DX
INT 21H                 ; Call interrupt 21H
ENDM                    ; End of macro

DATA SEGMENT                        ; Start of data segment
    MESG DB "BINARY NUMBER IS : $"  ; Message to display binary number 
    STR1 DB 20 DUP('$')             ; String to store binary number
    STR2 DB 20 DUP('$')             ; String to store binary number in reverse order
    NUMBER DW 110                   ; Number to convert in binary
    LINE DB 10,13,'$'               ; Line to display
DATA ENDS                           ; End of data segment

CODE SEGMENT                        ; Start of code segment

START:
         MOV AX,DATA                ; Initialization of data segment
         MOV DS,AX
         
         LEA SI,STR1                ; Load address of string to SI
         MOV AX,NUMBER              ; Load number to AX
         MOV BH,00                  ; Move 0 to BH register
         MOV BL,2                   ; Move 2 to BL register 
         
      L1:DIV BL                     ; Divide AX by 2
         ADD AH,'0'                 ; Add '0' to AH
         MOV BYTE PTR[SI],AH        ; Store result in string
         MOV AH,00                  ; Move 0 to AH
         INC SI                     ; Increment SI
         INC BH                     ; Increment BH
         CMP AL,00                  ; Compare AL with 0
         JNE L1                     ; Jump to L1 if not equal

         MOV CL,BH                  ; Move BH to CL
         LEA SI,STR1                ; Load address of string to SI
         LEA DI,STR2                ; Load address of string to DI
         MOV CH,00                  ; Move 0 to CH
         ADD SI,CX                  ; Add CX to SI
         DEC SI                     ; Decrement SI

      L2:MOV AH,BYTE PTR[SI]        ; Move byte pointed by SI to AH
         MOV BYTE PTR[DI],AH        ; Move AH to byte pointed by DI
         DEC SI                     ; Decrement SI
         INC DI                     ; Increment DI
         LOOP L2                    ; Loop L2 if not equal

         DIS LINE                   ; Display line
         DIS MESG                   ; Display message
         DIS STR2                   ; Display string

         MOV AH,4CH                 ; Function number for exit
         INT 21H                    ; Call interrupt 21H

CODE ENDS                           ; End of code segment
END START                           ; End of program