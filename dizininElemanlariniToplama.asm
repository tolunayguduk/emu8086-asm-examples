.MODEL SMALL
.STACK 64
.DATA
    DIZI DB 1,2,3,4,5,6,7,8,9,10
    SONUC DB ?
.CODE
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS,AX
        MOV AL,0
        MOV CX,10
        LEA SI, DIZI
        
        BAS:
            MOV BL,[SI]
            ADC AL,BL
            INC SI
            LOOP BAS
            MOV SONUC,AL
        
        MOV AH,4CH
        INT 21H
ANA ENDP
END ANA