data segment
    string1 db 'hasan$'
    string2 db '-----$'
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    lea si,string1
    lea di,string2
    
    mov cx,5
    
    do: 
        ;sadece movsb de denebilir.
        lodsb
        stosb
        LOOP do
        
    
    lea dx,string1
    mov ah,09
    Int 21h
    

mov ax, 4c00h
int 21h  

ends

end start
