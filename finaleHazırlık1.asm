data segment
    cumle db 16 dup(' ')
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax,data
    mov ds,ax
    
    lea si,cumle
    mov cx,16
    
    don:
        mov ah,01h
        Int 21h
        
        mov [si],al
        inc si
        
        LOOP don
    
    
    mov cx,16
    lea si,cumle
    mov dl,[si]
    
    yaz:
        mov ah,02h
        Int 21h
        
        inc si
        mov dl,[si]
        LOOP yaz
        
        
        
mov ax, 4c00h
int 21h  

ends

end start
