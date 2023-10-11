.MODEL SMALL
.STACK 100H

.DATA 
HLW DW "Hello World$";


.CODE

MAIN PROC 
    ;INITIALIZE DATA SEGMENT
    MOV AX, @DATA;
    MOV DS, AX;
    ;DISPLAY MESSAGE  
    
    
    
   FLAG: LEA DX,HLW;
    MOV AH,09;
    INT 21H;
    
    MOV AH,02H; default for String 
    MOV DL,0DH; string return
    INT 21H; execute handler
    
    MOV AH,02H; default for String
    MOV DL,0AH; feeding line (new line)
    INT 21H; execute handler
             
    JMP FLAG; unconditonal jump
                                
    MOV AH,4CH; RETURN DOS
    INT 21H;    DOS EXIT
    
    
    MAIN ENDP;
    END;