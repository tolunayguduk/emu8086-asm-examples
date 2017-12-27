.MODEL SMALL
.STACK 64
.DATA
    SONUC DW ?
.CODE 
    
    ;Sonuc 1 cikiyor. Halbuki daha buyuk
    ;cikmasi gerekirdi. Neden boyle?
     
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS, AX
        
        MOV CX,10
        CALL TOPLA
        MOV CX,50
        CALL TOPLA 
        
        MOV AH,4CH
        INT 21H
    ANA ENDP
    
    ;------------------alt program
    
    TOPLA PROC NEAR
        MOV BX,0 ; (!)Bu, TEKRAR icerisindeydi.
        TEKRAR:
            ADD BX,CX
            LOOP TEKRAR
            MOV SONUC,BX
            RET
    TOPLA ENDP


    