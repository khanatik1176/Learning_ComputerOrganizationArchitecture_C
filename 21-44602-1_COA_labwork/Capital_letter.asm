.MODEL SMALL

.STACK 100h

.DATA

 CR EQU 0DH
 LF EQU 0AH
 
 MSG1 DB 'ENTER A LOWER CASE LETTER : $'; Taking message in string 
 MSG2 DB  0DH,0AH, 'IN UPPER CASE IT IS: '; taking message in string
 CHAR DB ?,'$'

.CODE

    MAIN PROC 
       ;initialize DS
       
       MOV AX, @DATA ; get data segment
       MOV DS,AX     ; initialize DS
       ;print user prompt
       
       LEA DX,MSG1 ; get first message
       MOV AH,9 ; Display string function
       INT 21H ; Display first message
       MOV AH,1 ; read character function
       INT 21h ; read a small letter into AL
       SUB AL,20H ; convert it to upper case
       MOV CHAR,AL ; store the AL
       
       LEA DX,MSG2 ; get second message
       MOV AH,9 ; display string function
       INT 21h ; display message and uppercase letter
       
       MOV AH,4CH ; DOS exit
       INT 21H    
       
       MAIN ENDP
    END