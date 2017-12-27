.STACK 32

.DATA
    SAYI1 DB 45
    SAYI2 DB 30
    SONUC DB ?

.CODE
    hesapla PROC FAR
        mov ax,@DATA
        mov ds,ax
        
        mov al,SAYI1
        mov bl,SAYI2
        add al,bl
        mov SONUC,al 
        
        MOV AH,4CH
        INT 21H
    hesapla ENDP
    END hesapla
        