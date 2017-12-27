data segment
    numbers db ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    
    mov ax,data
    mov ds,ax
    mov es,ax
    
    lea si,numbers
    mov cx,10
    
    gir:
    mov ah,00  ; 21h kesmesinin 01 nolu fonksiyonu da kullanilabilirdi. Ikisi de input'u al'ye atiyor.
    Int 16h
    mov [si],al
    inc si
    loop gir 
    
      
    call clrscrn
    call curpos  
      
    sub si,10  ; dizinin basina registerimiz gecirilir.
    mov cx,10
    mov bl,4   ; 4 e bolunebilme durumu icin kullanilir.
    yazdir:
    mov al,[si]
    div bl
    cmp ah,0
    jne bolunmez
    mov ah,02h
    mov dl,[si]
    Int 21h     
    bolunmez:
    inc si
    loop yazdir
    
    
mov ax, 4c00h
int 21h  

ends

clrscrn proc
    mov ax,0620h
    mov bh,2Fh
    mov cx,0000h
    mov dx,0FFFh
    int 10h
    ret
clrscrn endp

curpos proc
    mov ah,02h
    mov bh,00h
    mov dh,10h
    mov dl,10h
    Int 10h
    RET
curpos endp

end start
