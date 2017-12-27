data segment
     SAYI1 DB 10 ; DB DEFINE BYTE ANLAMINA GELIR. 1 BYTE'LIK ALAN AYRILIR. 10 SAYISI ATANIR
     SAYI2 DB 30
     SONUC DB ?
ends

stack segment
    dB   32  dup(0) ; 32 TANE BIT AYIR VE 0 ILE DOLDUR
ends

code segment
start: ; main function starts. Ana fonksiyonun adi start'tir.
    
    ;farkli segmentler kullanildigi icin bu bolume ihtiyac vardir.
    ;########################################################
    MOV AX,data ; ax'e data segmentinin baslangic adresini at.
    MOV ds,ax ; mov ds,data diye bir komut olmadigindan boyle yapilir.
              ; mov sadece belli parametreleri alir. 
    ;########################################################
    
    
    
    MOV AL,SAYI1
    MOV BL,SAYI2
    ADD AL,BL   
    MOV SONUC,AL


;return komutu
mov ax, 4c00h
int 21h ; ah 4c ise ve 21 nolu kesme cagiriliyorsa program biter. 
        ; 21h nolu interrupt cagirilir.
ends

end start