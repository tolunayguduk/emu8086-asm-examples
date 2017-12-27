.STACK 64 

.DATA
    MESAJ1 DB 'BiLGiSAYAR$' 
    
.CODE   
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS, AX
        
        ;----------------ekran modu seciliyor.
        MOV AH,00
        MOV AL,03 ;Text ekran
        INT 10H
        
        ;--------------
        CALL EKRSIL
        LEA DX,MESAJ1 ; Mesajin ofset adresi
        
        ; DX kaydecisine alinir
        CALL YAZ
        MOV AH,4CH
        INT 21H
        
        ;------------------alt program
        YAZ PROC
            MOV AH,09
            INT 21H
            RET
        YAZ ENDP
        ;-----------------------------
        
        ;------------------------alt program
        EKRSIL PROC
            MOV AX,0600H
            MOV BH,30H
            MOV CX,0000H
            MOV DX,184FH
            INT 10H
            RET
        EKRSIL ENDP
        ;-----------------------------------
        
  END ANA