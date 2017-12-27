.MODEL SMALL
.STACK 64
.DATA
    MESAJ DB 'BILGISAYAR'
    SUT DB 0DH
    CHAR DB 0
.CODE
    ANA PROC NEAR
        MOV AX,@DATA
        MOV DS, AX
        
        CALL EKRSIL
        
        LEA SI, MESAJ ; SI=Ofset adresi
        MOV CX,10 ; 10 defa dongu kur
        
        TEKRAR:
            MOV BL,[SI] ; Bir karakter BLye at
            MOV CHAR, BL
            
            CALL KURKON ; imlec konumla
            CALL YAZ ; bir karakter yaz
            
            INC SI ; adresi 1 artýr
            INC SUT ; sutunu bir artýr
            LOOP TEKRAR
        
        MOV AH,4CH ; DOS a dön    
        INT 21H
    ANA ENDP
    
    EKRSIL PROC
        MOV AH,06H ;Kac satir silinecek
        MOV AL,0AH ;Fonksiyon numarasi
        MOV BH,30H ;Zemin Rengi(3),Karakter Rengi(0)
        MOV CX,0C0CH;Ust sol kose koordinati
        MOV DX,1428H;Alt sag kose koordinati
        INT 10H
        RET
    EKRSIL ENDP
    
    KURKON PROC
        MOV AH,02   ;fonksiyon numarasi
        MOV BH,00   ;sayfa numarasi
        MOV DH,0FH  ;satir
        MOV DL,SUT  ;sutun
        INT 10H
        RET
    KURKON ENDP
        
    ;Tek karakter yaz
    YAZ PROC
        MOV AH,02
        MOV DL,CHAR
        INT 21H
        RET
    YAZ ENDP
    
    END ANA