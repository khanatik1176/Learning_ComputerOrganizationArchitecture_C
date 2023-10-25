.MODEL small
.STACK 100h

.DATA
CR EQU 0DH

LF EQU 0AH



MSG1 DB 'ENTER Alphabets : $' ; Taking message in string

MSG2 DB 0DH, 0AH, 'Alphabet in reverse order : $' ; Taking message in string

CHAR1 DB ? ; Variable to store the first character

CHAR2 DB ? ; Variable to store the second character



.CODE

MAIN PROC

  ; Initialize DS

  MOV AX, @DATA  ; Get data segment

  MOV DS, AX   ; Initialize DS



  ; Print user prompt for the first character

  LEA DX, MSG1   ; Load the address of the first message

  MOV AH, 9    ; Display string function

  INT 21H     ; Display the first message



  ; Read the first character

  MOV AH, 1    ; Read character function

  INT 21H     ; Read a small letter into AL

  MOV CHAR1, AL  ; Store the result in CHAR1
 



  ; Read the second character

  MOV AH, 1    ; Read character function

  INT 21H     ; Read a small letter into AL

  MOV CHAR2, AL  ; Store the result in CHAR2



  ; Display the second message

  LEA DX, MSG2   ; Load the address of the second message

  MOV AH, 9    ; Display string function

  INT 21H     ; Display the message


   MOV DL, CHAR2  ; Load the second converted character into DL

  MOV AH, 2    ; Display character function

  INT 21H     ; Display the second uppercase letter 
   
   
   
   
  ; Display the uppercase letters

  MOV DL, CHAR1  ; Load the first converted character into DL

  MOV AH, 2    ; Display character function

  INT 21H     ; Display the first uppercase letter



  ; Exit the program

  MOV AH, 4CH   ; DOS exit

  INT 21H



MAIN ENDP

END
