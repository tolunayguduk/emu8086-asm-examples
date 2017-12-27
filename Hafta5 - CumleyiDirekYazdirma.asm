.MODEL SMALL
.STACK 64
.DATA
    MESAJ1 DB "BiLGiSAYAR$"
.CODE
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS, AX
        
        CALL EKRSIL
        CALL YAZ
        
        MOV AH,4CH
        INT 21H
    ANA ENDP
    
    YAZ PROC
        LEA DX,MESAJ1
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