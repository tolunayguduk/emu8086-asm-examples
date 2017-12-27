data segment
    sayi db ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax,data
    mov ds,ax
    
    ;Input, al'ye atanir.
    mov ah,01h
    Int 21h
    
    ; al, girilen sayinin(tusun)
    ; ASCII kodunu tutar. Sayinin
    ; kendisini gorebilmek icin 
    ; ASCII kodundan 30h cikarilmalidir.
    
    sub al,30h   
    mov sayi,al
    
mov ax, 4c00h
int 21h  

ends

end start
