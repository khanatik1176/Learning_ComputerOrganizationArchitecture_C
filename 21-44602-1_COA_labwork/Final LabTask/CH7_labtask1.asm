.model small 
.stack 100h

.data 

; Data declaration 
prompt db 'Enter a character:$'
msg_upper db 0ah,0dh,'Converted to upper case:$'
msg_lower db 0ah,0dh,'Converted to lower case:$'
msg_not_letter db 'Input is not a letter.$'
input_char db ?

.code 
main proc  
    
    MOV AX, @DATA
    MOV DS, AX
    
    ; print prompt
    mov ah, 09h
    lea dx, prompt
    int 21h
    
    ; read input character
    mov ah, 01
    int 21h
    mov bl, al ; save input character
    
    ; check if input is a letter
    cmp bl, 'A'
    jb not_letter
    
    cmp bl, 'Z'
    jbe upper_case
    
    cmp bl, 'a'
    jb not_letter
    
    cmp bl, 'z'
    ja not_letter
    
    lower_case:
    ; convert to upper case
    and bl, 11011111b
    
    ; print result
    mov ah, 09h
    lea dx, msg_upper
    int 21h 
    
    mov ah, 02h
    mov dl, bl
    int 21h
    jmp exit_program
    
    upper_case:
    ; convert to lower case
    or bl, 00100000b
    
    ; print result
    mov ah, 09h
    lea dx, msg_lower
    int 21h
    
    mov ah, 02h
    mov dl, bl
    int 21h
    jmp exit_program
    
    not_letter:
    ; print error message 
    mov ah, 09h
    lea dx, msg_not_letter
    int 21h
    
    exit_program:
    mov ah, 4ch
    int 21h
    
main endp
end main
