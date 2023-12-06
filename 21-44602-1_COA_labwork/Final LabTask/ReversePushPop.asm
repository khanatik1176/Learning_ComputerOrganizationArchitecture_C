.MODEL SMALL
.STACK 100H
.DATA
Message DB 0AH,0DH,"BEFORE REVERSE : $"
Message1 DB 0AH,0DH,"AFTER REVERSE : $" 

.CODE 
    MAIN PROC
        ;INITIALIZE DATA SEGMENT
        MOV AX, @DATA
        MOV DS, AX

        ;MSG DISPLAY
        LEA DX, Message
        MOV AH, 09H
        INT 21H

        ;READ THREE CHARACTERS
        MOV AH, 01H
        INT 21H
        PUSH AX

        MOV AH, 01H
        INT 21H
        PUSH AX

        MOV AH, 01H
        INT 21H
        PUSH AX

        ;MSG DISPLAY
        LEA DX, Message1
        MOV AH, 09H
        INT 21H

        ;DISPLAY IN REVERSE ORDER
        POP DX
        MOV AH, 02H
        INT 21H

        POP DX
        MOV AH, 02H
        INT 21H

        POP DX
        MOV AH, 02H
        INT 21H

        ;DOS RETURN
        MOV AH, 4CH
        INT 21H

    MAIN ENDP
END MAIN
