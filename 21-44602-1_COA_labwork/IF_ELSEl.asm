.model small

.stack 100h

.data


.code

    main proc
        
        mov ax,6;
        mov bx,10;
        mov cx,8;
        
        cmp ax,bx;
        jl case1;
        
        case1:
            cmp bx,cx;
            jl case2;
            jg else; 
            
        case2:
            mov ax,0;
            jmp endcase
        
        
        else:
            mov bx,0;
            jmp endcase;   
         
        
         
        endcase:
  
        
        ;Return DOS
        mov ah,4ch;
        int 21h; DOS Exit
        
       
        main endp;
    end;  

       