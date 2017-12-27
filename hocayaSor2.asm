
;BILGISAYAR yerine EILBISAYAR yaziyor, neden?

.MODEL SMALL
.STACK 64
.DATA
    KAYNAK DB 'BILGISAYAR'
    HEDEF DB 'ELEKTRONIK'
    HEDEF2 DB 10 DUP (' ')
.CODE
    ANA PROC FAR
        mov ax,@DATA
        mov ds,ax
        mov es,ax
        
        CALL BASSON
        CALL SONBAS
        
        mov cx,10  
        lea si,HEDEF2
        
        yazdir:
        mov dl,[si]
        mov ah,02h
        Int 21h
        inc si
        LOOP yazdir 
        
        
        mov cx,10  
        lea si,HEDEF
        
        yazdir1:
        mov dl,[si]
        mov ah,02h
        Int 21h
        inc si
        LOOP yazdir1
        
        
        
        MOV AH,4CH
        INT 21H
    ANA ENDP
    
    BASSON PROC NEAR
        CLD ; soldan saga dogru
        MOV CX,10
        LEA SI, KAYNAK
        LEA DI, HEDEF2
        REP MOVSB
        RET
    BASSON ENDP
   
    SONBAS PROC NEAR
        STD ; sagdan sola dogru
        MOV CX,10
        LEA SI,KAYNAK+10
        LEA DI,HEDEF+10
        REP MOVSB
        RET
    SONBAS ENDP
    
    END ANA