ASSUME CS:CODE, DS:DATA
DATA SEGMENT
  NUM1 DW  1020H
  NUM2 DW  3040H
  SUM  DW  ?
DATA ENDS
CODE SEGMENT
  START:
        MOV  AX,DATA
        MOV  DS,AX

        MOV  BX,NUM1
        MOV  CX,NUM2

        ADD  CX,BX
        MOV  SUM,CX
CODE ENDS
END START
