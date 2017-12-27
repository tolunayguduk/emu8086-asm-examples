.MODEL SMALL
.STACK 64
.DATA
    SONUC DW ?
.CODE
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS, AX
        MOV AX,00
        MOV CX,100
        
        BAS:
            ADD AX, CX
            DEC CX
            JNE BAS; Sonuç sýfýr deðilse BAS a git
            MOV SONUC, AX 
            
            MOV AH,4CH
            INT 21H
    
    ANA ENDP
    END ANA