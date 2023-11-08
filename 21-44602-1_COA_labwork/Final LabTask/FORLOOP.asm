.model small;

.stack 100h;

.data 

.code 

main proc 
    mov cx,49;
    mov ax,1;
    mov bx,4;
    mov dx,0;
    
    
for_loop:

add dx,ax;

add ax,bx


loop for_loop;

mov ax,4ch;
int 21h;
  

main endp;
end;

