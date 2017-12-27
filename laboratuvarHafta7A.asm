data segment
     sayilar db 10 dup(?)
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov cx,10
    lea si,sayilar
    
    dongu:
        mov ah,01h
        int 21h
        mov [si],al
        inc si
        loop dongu
          
        call clrscrn
          
        mov cx,10
        mov bl,4
        mov ax,0 ; call fonksiyonu yuzunden konuldu
        lea si,sayilar
        dongu2: 
            mov al,[si]
            shr al,01
            jc bolunmez
            shr al,01
            jc bolunmez
            mov ah,02h
            mov dl,[si]
            int 21h
            bolunmez:
                inc si
            loop dongu2
            
            
            
            
mov ax, 4c00h
int 21h  
  clrscrn proc
    mov ax,060ah
    mov bh,47h
    mov cx,0000h
    mov dx,0909h
    int 10h
    ret
  clrscrn endp
ends

end start
