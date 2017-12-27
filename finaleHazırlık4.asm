data segment
    aLSB db ?
    aMSB db ?
    bLSB db ?
    bMSB db ? 
    sonucLSB db ?
    sonucMSB db ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax,data
    mov ds,ax
    
    mov ah,01h
    Int 21h 
    sub al,30h
    mov aMSB,al
    
    mov ah,01h
    Int 21h   
    sub al,30h
    mov aLSB,al
    
    mov ah,01h
    Int 21h   
    sub al,30h
    mov bMSB,al
    
    mov ah,01h
    Int 21h   
    sub al,30h
    mov bLSB,al
    
    
    mov al,aLSB
    add al,bLSB
    
    mov bl,aMSB
    adc bl,bMSB
    
    
    mov sonucLSB,al
    mov sonucMSB,bl
    
    
    

mov ax, 4c00h
int 21h  

ends

end start
