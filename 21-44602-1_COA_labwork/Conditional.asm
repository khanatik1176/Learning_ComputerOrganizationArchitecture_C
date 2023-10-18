.model small

.stack 100h

.data

Hello db "Hello World$";
Bye db "Bye World$";
count1 dw 10;
count2 dw 5;

.code

    main proc
            
            
        mov ax,@data;
        mov ds,ax;
        
            
        mov cx, count1;  counter1 stored in cx
        mov bx, count2;   counter2 stored in bx
            
        ;printing hello world
        print_hello:
        lea dx,Hello;
        mov ah,09h;
        int  21h;
        
        mov ah,02h;
        mov dl, 0dh;
        int 21h;
        mov dl,0ah;
        int 21h;
        
        ;decrement the counter1
        dec cx;
        
        ;Check if we've printed "Hello world 10 times"
        
        cmp cx,0;
        JG print_hello;
        
        
                      

        print_bye:              
        
        mov ah,02h;
        mov dl, 0dh;
        int 21h;
        mov dl,0ah;
        int 21h;
        
        
        lea dx,Bye;
        mov ah,09h;
        int 21h;
          
        dec bx; decrement couter2
        cmp bx,0; comparing if bye prints 5 five times or not
        JG print_bye;
        
        ;Return DOS
        mov ah,4ch;
        int 21h; DOS Exit
        
       
        main endp;
    end;
