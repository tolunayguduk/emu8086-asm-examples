data segment
    dizi db 'hasan$'
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov si,offset dizi
    
    inc byte ptr [si]
    
    lea dx,dizi
    mov ah,09h
    Int 21h
    

mov ax, 4c00h
int 21h  

ends

end start
