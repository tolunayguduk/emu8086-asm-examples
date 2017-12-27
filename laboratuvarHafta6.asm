data segment
    cumle db "bugun hava cok guzel$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov ah,09h
    lea dx,cumle
    int 21h

mov ax, 4c00h
int 21h  

ends

end start
