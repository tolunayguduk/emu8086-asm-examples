data segment
     sayilar db 10 dup(?) 
     bolunurMesaji db " sayisi 4'e bolunur$"
     bolunmezMesaji db " sayisi 4'e bolunmez$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov cx,0
    lea si,sayilar
    
    dongu:
        mov ah,01h
        int 21h 
        cmp al,0Dh ; enter'n ascii kodu kullanildi.
        je bitir
        sub al,30h
        mov [si],al
        inc si 
        inc cx
        jmp dongu
         
        push cx;push veriyi stack'e kaydeder.
        call clrscrn ; cx manipulasyona ugrar.
        pop cx ;pop ile manipulasyona ugramamis verimiz stack'ten geri cx'e alir.
        
        bitir:
        mov bl,[si]
        dec si
        mov al,[si]
        mov dl,10
        mul dl
        add al,bl
        mov dl,4
        div dl
        cmp ah,0
        jne bolunmez
        
        push cx ; cx'imiz stack'e yedeklenir.
        call clrscrn
        call curpos
        pop cx  ; stack'ten pop ile yedek cx'e atanir.
               
        lea si,sayilar
        yazdir:       
            mov ah,02h
            mov dl,[si]
            add dl,30h
            int 21h
            inc si
            loop yazdir
            lea dx,bolunurMesaji
            mov ah,09h
            Int 21h 
            jmp sonlandir     
        bolunmez:    
            lea dx,bolunmezMesaji
            mov ah,09h
            Int 21h
        
        sonlandir:
           
            
mov ax, 4c00h
int 21h
  
clrscrn proc
    mov ax,060ah
    mov bh,47h
    mov cx,0000h
    mov dx,3030h
    int 10h
    ret
clrscrn endp
        
curpos proc
    mov ah,02h
    mov bh,3Fh
    mov dh,55h
    mov dl,77h
    Int 10h
    RET
curpos endp
ends

end start
