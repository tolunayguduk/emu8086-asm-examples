.MODEL SMALL
.STACK 64
.DATA
    DIZI DB 'LDA #305A'
.CODE
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS,AX
        MOV ES,AX
        
        CLD
        MOV AL,'#'  ; standarttir AL, scas icin
        MOV BH,'$'
        MOV CX,9
        LEA DI,DIZI
        REPNE SCASB
        JNE CIK
        
        MOV BYTE PTR [DI-1], BH
        
        CIK:
            lea si,DIZI
            mov cx,9 
            don:
                mov dl,[si]
                mov ah,02h
                Int 21h
                inc si
                loop don
                
                
            MOV AH,4CH
            INT 21H
    ANA ENDP
    END ANA