.MODEL SMALL
.STACK 100h

.DATA  

SAMPLE DB "Enter a Character: $"
CHAR1 DB ?,'$'; To store input
Thank DB "Thank you.$"

.CODE

MAIN PROC   
    
    MOV AX,@data;
    MOV DS,AX;
    
    LEA DX,SAMPLE;
    MOV AH,09h;
    INT 21H;
    mov ah,01h; taking input 
    int 21h;
    mov CHAR1,al;  
    
    
    mov cx,50;  count limit
    mov ah,02h;
    mov dl,0dh;
    int 21h;
    mov dl,0ah;
    int 21h;
    mov dl,CHAR1;
    DEC cx;  decrementing count
    
    JCXZ END; checks if it is CX = 0 
    
    LOOPER: ;Loop
    
    INT 21H;
    LOOP LOOPER;
    
    END:
         
    mov ah,02h;
    mov dl,0dh;
    int 21h;
    mov dl,0ah;
    int 21h;
    
    mov ah,02h;
    mov dl,0dh;
    int 21h;
    mov dl,0ah;
    int 21h;     
         
         
    mov ah,02h;
    mov dl,0dh;
    int 21h;
    mov dl,0ah;
    int 21h;   
    
    LEA DX,Thank
    MOV AH,09h;
    INT 21H;
    
    MOV AH,4CH;
    INT 21H; 
    
    
    main endp;
end;