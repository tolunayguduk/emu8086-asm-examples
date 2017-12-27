
;Ekrandan girilen "sayinin" 3 ile 
;tam bolunup bolunmedigini bulan
;programi yapin.

data segment
    bolunurMetin db 'Sayi 3 ile tam bolunur$'
    bolunmezMetin db 'Sayi 3 ile tam bolunmez$'
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
     mov ax,data
     mov ds,ax
     
     mov bx,0 
     mov dl,10 ; Mesela 5 girildi. 5*10 = 50. Ýkinci sayi girildi: 2 . 
               ; 50+2=52 olur. Goruldugu gibi 5 ve 2 sayilari yanyana tutuluyor. 
               ; Girilen iki deger yanyana tutuluyor. Yani sanki input verimiz 
               ; iki haneli bir sayi oldu.
     mov ax,0
     
     dongu:
        push ax  ; ax yedeklenir.
        
        mov ax,bx ; asagidaki mul komutu ax'i kullanir implicitly.
        
        
        ;basla:
        ;call clrscreen
        
        mul dl
        mov bx,ax
        pop ax
        
        
        mov ah,0   
        add bx,ax
        mov ah,01
        int 21h
        cmp al,0dh ; enter'in ascii kodu 0dh
        je bitir
        sub al,30h ; Girilen karakterin sayisal degeri ortaya cikarilir
        jmp dongu
    
        bitir:
        mov cx,3
        mov ax,bx 
        mov dx,0
        div cx
        cmp ah,0
        jne bolunmez
        mov ah,09h
        mov dx,offset bolunurMetin
        int 21h
        jmp son
        bolunmez:
        mov ah,09h
        mov dx,offset bolunmezMetin ; lea dx,bolunmezMetin
        Int 21h
        son:
        ;jmp basla
        
mov ax, 4c00h
int 21h  

ends

clrscreen proc    
    mov ax,060ah
    mov bh,46                                                                                                                        
    mov cx,0
    mov dx,092Ah
    int 10h
    ret
clrscreen endp

end start
