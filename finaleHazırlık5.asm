data segment
     sayi1 db ? 
     sayi2 db ?    
     result db ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax,data
    mov ds,ax
    
    ;Sayi1
    ;----------------
    mov ah,00h
    Int 16h
    
    sub al,30h 
    mov cl,10
     
    mul cl
    mov bl,al
    
    mov ah,00h
    Int 16h  
    
    sub al,30h
    add bl,al
    
    mov sayi1,bl
    ;----------------
    
    
    ;Sayi2
    ;----------------
    mov ah,00h
    Int 16h
    
    sub al,30h
    mov cl,10
    
    mul cl
    mov bl,al
    
    mov ah,00h
    Int 16h
    
    sub al,30h
    add bl,al
    
    mov sayi2,bl
    ;---------------- 
                     
                     
                     
    ;Sayi1+Sayi2
    ;----------------
    mov dl,sayi1
    mov cl,sayi2
    add dl,cl
    mov result,dl    
    ;----------------

mov ax, 4c00h
int 21h  

ends

end start
