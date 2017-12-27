


;5.EKRAN ISLEMLERI PDF'I, SAYFA 11

;SOR -> ESCAPE TUSU ILE PROGRAMDAN CIKILAMIYOR. NORMAL TUS BILDIRIMI GORUNUYOR. NEDEN?


.MODEL SMALL
.STACK 64
.DATA
MESAJ1 DB 'NORMAL TUSA BASTINIZ$'
MESAJ2 DB 'NORMAL OLMAYAN BIR TUSA BASTINIZ$'
MESAJ3 DB 'CIKIYOSUNUZ$'
.CODE
ANA PROC FAR
    MOV AX,@DATA
    MOV DS,AX 
    MOV ES,AX
    
    CALL EKRSIL
    CALL KURKON
    
    BAS:
        MOV AH,00
        INT 16H
        
        PUSH AX
        
        CALL EKRSIL
        CALL KURKON
        
        POP AX
        
        CMP AL,0
        JNE ATLA1
        
        CALL NORDEGIL
        JMP BAS
        
        ATLA1:
            CALL NORMAL
            CMP AL,27 ; 27, escape'in ascii kodu.  (!) BURASI CALISMIYOR/ISLEMIYOR.
            JNE BAS
            CALL CIK
        SON:
            MOV AH,4CH
            INT 21H
    ANA ENDP
    
    NORMAL PROC
        LEA DX,MESAJ1
        MOV AH,09
        INT 21H
        RET
    NORMAL ENDP
    
    NORDEGIL PROC
        LEA DX,MESAJ2
        MOV AH,09
        INT 21H
        RET
    NORDEGIL ENDP
    
    CIK PROC
        LEA DX,MESAJ3
        MOV AH,09
        INT 21H
        RET
    CIK ENDP
    
    EKRSIL PROC
        MOV AX,0600H
        MOV BH,30H
        MOV CX,0000H
        MOV DX,284FH
        INT 10H
        RET
    EKRSIL ENDP
    
    KURKON PROC
        MOV AH,02
        MOV BH,00
        MOV DH,12
        MOV DL,12
        INT 10H
        RET
    KURKON ENDP
    
    END ANA