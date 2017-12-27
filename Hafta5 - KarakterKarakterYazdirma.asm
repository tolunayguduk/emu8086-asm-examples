.MODEL SMALL
.STACK 64
.DATA
    MESAJ DB 'BILGISAYAR'
    SUT DB 0DH
    CHAR DB 0
.CODE
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS, AX
        
        CALL EKRSIL
        
        LEA SI,MESAJ ; SI=Ofset adresi
        MOV CX,10 ; 10 defa dongu kur
        
        TEKRAR:
            MOV BL,[SI] ; Bir karakter BLye at
            MOV CHAR,BL
            
            CALL KURKON ; imlec konumla
            CALL YAZ ; bir karakter yaz
            
            INC SI ; adresi 1 artýr
            INC SUT ; sutunu bir artýr
            LOOP TEKRAR
        
        MOV AH,4CH ; DOS a dön
        INT 21H
    ANA ENDP
    
    KURKON PROC
        MOV AH,02
        MOV BH,00
        MOV DH,0DH
        MOV DL,SUT
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
    
    EKRSIL PROC
        MOV AX,060AH
        MOV BH,30H
        MOV CX,0C0CH
        MOV DX,1428H
        INT 10H
        RET
    EKRSIL ENDP
    
    END ANA