data segment
   sayilar db 4,5,6,1,2,3,8,9,6,1
   enbuyuk db ?
ends

stack segment  
    dw   128  dup(0)
ends

code segment
start:

    mov ax,data
    mov ds,ax
    mov cx,10
    
    lea si,sayilar ; sayilar dizisinin offset deðerini si isimli kaydediciye atýyor. (Source Index)
    mov al,[si]     ; [] kullanmak o adresteki veriyi getirmek anlamýna gelir. al = 1 oldu.
    
    dongu:
      inc si
      cmp al,[si]  ; al büyükse devamet çalýþýr
      JA devamet
      mov al,[si]
    
      devamet:
        loop dongu
        mov enbuyuk,al    
    
        call ekraniTemizle
    
        ;ekrana çýktý verme
        mov ah,02
        mov dl,enbuyuk
        add dl,30h
        int 21h 
        
        mov ax, 4c00h
        int 21h  
        
        
    
    ekraniTemizle proc
       mov ah,06h         ;6 numaralý fonk ekraný tmeizler. Kaç satýr ...
       mov bh,30h
       mov cx,0000h   ; Ýlk arkaplan rengi, sonraki yazý rengi
       mov dx,0909h  ; tamamýný temizlemesin
       int 10h
    
        mov ah,02h   ; cursor'ýn konumunubelirtir
        mov bh,00h
        mov dh,00h
        mov dl,00h
        int 10h
        
    
       RET ; Alt fonksiyon yazýldýðý zaman her zaman RET yazýlmalý ki program kaldýðý yerden devam edebilsin.
    
    ekraniTemizle endp
code ends    

end start