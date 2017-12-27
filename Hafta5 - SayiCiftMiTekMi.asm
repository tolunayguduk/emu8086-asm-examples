.MODEL SMALL
.STACK 64
.DATA
    TEK DB 'TEK$'
    CIFT DB 'CIFT$'
    SAYI DB 12
.CODE
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS, AX 
        
        MOV AH,00
        MOV AL,03
        INT 10H   
        
        CALL EKRSIL
        CALL YAZ 
        
        MOV AH,4CH
        INT 21H
    ANA ENDP    
    
    ;0.bit 1 ise sayi tektir. 0 ise sayi
    ;cifttir. O halde SHR yapinca carry'ye
    ;1 gelirse sayi tektir, 0 gelirse sayi
    ;cifttir deriz.
    YAZ PROC
        MOV AL, SAYI
        SHR AL,1
        JNC DEVAM
        LEA DX, TEK
        MOV AH,09
        INT 21H
        RET
        
        DEVAM: LEA DX, CIFT
        MOV AH,09
        INT 21H
        RET
    YAZ ENDP
    
    EKRSIL PROC
        MOV AX,0600H
        MOV BH,30H
        MOV CX,0000H
        MOV DX,284FH
        INT 10H
        RET
    EKRSIL ENDP
    
    END ANA