.MODEL SMALL

.STACK 100H

.DATA

MSG1 DW "HELLO$"; 
MSG2 DW "WELCOME$";

.CODE

  MAIN PROC

    ;INITIALIZE DATA SEGMENT

    MOV AX,@DATA; ; get data segment

    MOV DS,AX; initialize DS
       
    ;DISPLAY DATA

    LEA DX,MSG1; Get message1 as input 

    MOV AH,09;Display String function

    INT 21H;display msg1

    ;To add new line

    MOV AH,02H;load string

    MOV DL,0DH;string return

    INT 21H; excuting the operation
    
    MOV AH,02H;

    MOV DL,0AH;line feed

    INT 21H; 
    ;display data

    LEA DX,MSG2;Get message 2 as input

    MOV AH,09;display string function

    INT 21H; display msg2
         
    ;return DOS

    MOV AH,4CH;

    INT 21H     ;Dos exit

     

  MAIN ENDP;

END;