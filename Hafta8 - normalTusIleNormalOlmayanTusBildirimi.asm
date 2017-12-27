
;5.EKRAN ISLEMLERI PDF'I, SAYFA 10

.MODEL SMALL
.STACK 32
.DATA
    MESAJ1 DB 'NORMAL TUSA BASTINIZ$'
    MESAJ2 DB 'ASCII KODU OLMAYAN TUSA BASTINIZ$'
.CODE                                        

    ;SOR
    ;Tuslari dogru okumuyor program, neden?
    ;CEVAP
    ;Cunku PUSH ile ax yedeklenmediginden al
    ;degeri call ekrsil ve call imlec tarafindan
    ;degistiriliyor. Boylece girilen input verimiz
    ;kayboluyordu. PUSH AX ile girdimizi stack'e
    ;yedekleriz. call ile her iki fonksiyonu cagirdiktan
    ;sonra da pop ax ifadesi ile yigindan girdimizin
    ;degerini ax'e(al'ye) cekeriz.
    ;----------------------------------------

    ANA PROC FAR
        MOV AX,@DATA
        MOV DS, AX
        
        CALL EKRSIL
        CALL IMLEC
        
        MOV AH,00
        INT 16H
        
        BASLA:
            CMP AL,0
            JE ATLA
            
            CALL YAZMESAJ2
            CALL BAK
            
            PUSH AX      
            CALL EKRSIL
            CALL IMLEC
            POP AX
            
            JMP BASLA
        ATLA: 
            CALL YAZMESAJ
            CALL BAK
            
            PUSH AX     
            CALL EKRSIL   
            CALL IMLEC
            POP AX
            
            JMP BASLA 
             
        mov ah,4ch
        Int 21h
    ANA ENDP
    
    BAK PROC
        MOV AH,00
        INT 16H
        
        CMP AH,01
        JE GIT
        JMP DON
        GIT:
        MOV AH,4CH
        INT 21H
        DON: 
            RET
    BAK ENDP
    
    YAZMESAJ PROC
        LEA DX,MESAJ2
        MOV AH,09h
        INT 21H
        RET
    YAZMESAJ ENDP
    
    YAZMESAJ2 PROC
        LEA DX,MESAJ1
        MOV AH,09h
        INT 21H
        RET
    YAZMESAJ2 ENDP
    
    EKRSIL PROC
        MOV AX,0600H
        MOV BH,30H
        MOV CX,0000H
        MOV DX,184FH
        INT 10H
        RET
    EKRSIL ENDP
        
        
    IMLEC PROC
        MOV AH,02h
        MOV BH,00h
        MOV DH,00h
        MOV DL,00h
        INT 10H
        RET
    IMLEC ENDP  
    
    END ANA