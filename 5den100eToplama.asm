data segment
    result dw ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax,data
    mov ds,ax
     
    ;cx ve ax yerine cl ve al kullanildiginda
    ;toplama islemi bir noktadan sonra over-
    ;flow'a sebep olmaktadir. Dolayisiyla
    ;sonuc -80 cikmaktadir. Bunu onlemek icin
    ;8bitlik degiskenler yerine 16bitlik deg-
    ;isken olan ax ve cx kullanilmistir. Bura-
    ;da sadece al'yi ax yapip durumu kurtarabi-
    ;lirdik. Fakat o zaman da mov ax,cl olurdu
    ;Yani biri 16 bitlik degisken iken digeri
    ;8bitlik degisken olurdu ki bu syntax hata
    ;sidir. Dolayisiyla ikisini de 16bitlik
    ;yaptik.
     
    mov cx,100
    mov ax,0
    
    nokta:
        add ax,cx
        dec cx
        cmp cx,4
        jne nokta
        
        mov result,ax

mov ax, 4c00h
int 21h  

ends

end start
