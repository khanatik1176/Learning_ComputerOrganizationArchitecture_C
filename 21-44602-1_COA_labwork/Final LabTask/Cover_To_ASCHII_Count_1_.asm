.MODEL SMALL
.STACK 100H

.DATA
    Display_message DB 0DH, 0AH, 'TYPE A CHARACTER: $'
    Aschii_to_binary DB 0DH, 0AH, 'THE ASCII CODE OF A IN BINARY IS : $'
    Count_number_1 DB 0DH, 0AH, 'THE NUMBER OF l BITS IS: $'
    Proivde_input DB ?,'$'
    
.CODE
MAIN PROC
    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display the message
    LEA DX,Display_message
    MOV AH, 9
    INT 21H

    ;Take input from user
    MOV AH, 1
    INT 21H
    MOV Proivde_input, AL

    ; Print the binary representation of the ASCII code
    LEA DX, Aschii_to_binary
    MOV AH, 9
    INT 21H
    MOV CX, 8  ; Number of bits in ASCII code
    MOV BX, 80H ; Mask to check the leftmost bit

LOOPER:
    TEST Proivde_input, BL
    JZ PRINT_ZERO
    MOV DL, '1'
    JMP PRINT_ONE

PRINT_ZERO:
    MOV DL, '0'

PRINT_ONE:
    MOV AH, 2
    INT 21H

    SHR BX, 1
    LOOP LOOPER

    
    ; Count the number of set bits in the ASCII code
    LEA DX, Count_number_1
    MOV AH, 9
    INT 21H
    MOV CX, 8
    XOR BX, BX

COUNT_LOOP:
    TEST Proivde_input, 1
    JZ COUNT_ZERO
    INC BX

COUNT_ZERO:
    SHR Proivde_input, 1
    LOOP COUNT_LOOP

    ; Print the count of set bits
    ADD BX, '0'
    MOV DL, BL
    MOV AH, 2
    INT 21H

    
    ; Exit the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP

END MAIN