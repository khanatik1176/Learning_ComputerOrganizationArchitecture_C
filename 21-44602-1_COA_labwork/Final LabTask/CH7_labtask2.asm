.MODEL SMALL
.STACK 100H
.DATA
  MSG1 DB 'Enter a number:', '$'
  MSG2 DB 0AH,0DH, 'The number is even.', '$'
  MSG3 DB 0AH,0DH,'The number is odd.', '$'
  INPUT DB ?
.CODE
  MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display message asking for input
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H
    
    ; Read input character
    MOV AH, 01H
    INT 21H
    MOV BL, AL
    
    ; Check if input character is a number
    MOV AH, 00H
    MOV AL, BL
    AND AL, 0FH ; only keep the lower 4 bits
    CMP AL, 9
    JA NOT_NUMBER
    
    ; Check if the number is odd or even
    TEST BL, 01H
    JZ EVEN_NUMBER ; jump if the number is even
    
    ; Display message for odd number
    MOV AH, 09H
    LEA DX, MSG3
    INT 21H
    JMP EXIT_PROGRAM
    
    EVEN_NUMBER:
    ; Display message for even number
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H
    JMP exit_program
    
    NOT_NUMBER:
    ; Display error message for non-numeric input
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H
    
    EXIT_PROGRAM:
    MOV AH, 4CH
    INT 21H
  MAIN ENDP
END MAIN