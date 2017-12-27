.MODEL SMALL
.STACK 64
.DATA
    MESAJ1 DB 'BIR GIRDINIZ$'
    MESAJ2 DB 'IKI GIRDINIZ$'
    MESAJ3 DB 'UC GIRDINIZ$'
    MESAJ4 DB 'CIKIYOSUNUZ$'
.CODE
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS, AX
        
        CALL EKRSIL
        CALL IMLEC
        
        BAS:
            MOV AH,00
            INT 16H
            PUSH AX
            
            CALL EKRSIL
            CALL IMLEC
            
            POP AX
            
            CMP AL,'1'
            JNE ATLA1
            CALL BIR
        ATLA1:
            CMP AL,'2'
            JNE ATLA2
            CALL IKI
        ATLA2:
            CMP AL,'3'
            JNE ATLA3
            CALL UC
        ATLA3:
            CMP AL,'4'
            JNE BAS
            CALL DORT
        
        MOV AH,4CH
        INT 21H
    ANA ENDP
    
    BIR PROC
        LEA DX,MESAJ1
        MOV AH,09
        INT 21H
        RET
    BIR ENDP
    
    IKI PROC
        LEA DX,MESAJ2
        MOV AH,09
        INT 21H
        RET
    IKI ENDP
   
    UC PROC
        LEA DX,MESAJ3
        MOV AH,09
        INT 21H
        RET
    UC ENDP
    
    DORT PROC
        LEA DX,MESAJ4
        MOV AH,09
        INT 21H
        RET
    DORT ENDP
    
    EKRSIL PROC
        MOV AX,0600H
        MOV BH,20;30H
        MOV CX,0000H
        MOV DX,00;284FH
        INT 10H
        RET
    EKRSIL ENDP
    
    IMLEC PROC
        MOV AH,02
        MOV BH,00
        MOV DH,12
        MOV DL,12
        INT 10H
        RET
    IMLEC ENDP
    
    END ANA