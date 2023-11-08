.MODEL SMALL
.STACK 100H
.DATA
 COUNT DW ?  ; Declaring COUNT 
 NEWLINE DB 0DH, 0AH, '$'  ; New line 
.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, 0  ; Initialize DX with '0' 
    MOV AH, 1   ; Read character function

WHILE_:
    INT 21H     ; Read a character into AL
    CMP AL, 0DH ; Compare with Carriage return 
    JE END_WHILE ; If AL is carriage return,then exit

    INC DX      ; Increment DX 
    JMP WHILE_  ; Repeat again

END_WHILE:
    ; Display the count on a new line
    MOV COUNT, DX
    
    ; Display a new line
    LEA DX, NEWLINE
    MOV AH, 9
    INT 21H
    
   MOV AX, COUNT  ; Move the count into AX
    ADD AX, 3030H  ; Convert the count to its ASCII representation
    MOV DX, AX     ; DX now contains the ASCII character
    MOV AH, 2      ; Display character function
    INT 21H
    








