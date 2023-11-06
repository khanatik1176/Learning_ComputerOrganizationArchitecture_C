.model small

.stack 100h

.data
 
 MSG db "o$";
 MSG1 db "e$";

.code

    main proc
        
        ;INITIALIZE DATA SEGMENT
        MOV AX,@data;
        MOV DS,AX;
      
        MOV AL,2;Taking initial value in register
        
        CMP AL,1
        JE DISPLAY_O;Jump to display O;  
        
        CMP AL,3
        JE DISPLAY_O;Jump to display O; 
        
        CMP AL,2
        JE DISPLAY_E;Jump to display E; 
        
        CMP AL,4
        JE DISPLAY_E;Jump to display O;
        
        
        DISPLAY_O: 
        ;To Display O 
            
            LEA DX,MSG 
            MOV AH,09H
            INT 21H
            JMP DOS_RETURN; 
             
             
        DISPLAY_E: 
        ;To Display E 
            
            LEA DX,MSG1 
            MOV AH,09H
            INT 21H
            JMP DOS_RETURN;  
             
         
        DOS_RETURN:
  
        
        ;Return DOS
        mov ah,4ch;
        int 21h; DOS Exit
        
       
        main endp;
    end;  

       