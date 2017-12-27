data segment

ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ah,00h
    Int 16h
    
    mov dl,al
    mov ah,02h
    Int 21h

mov ax, 4c00h
int 21h  

ends

end start
