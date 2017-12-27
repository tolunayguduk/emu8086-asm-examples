.MODEL SMALL
.STACK 64
.DATA
    DIZI DB 'LDA #30#5A#'
.CODE
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS,AX
        MOV ES,AX
        
        CLD
        MOV AL,'#'  ; scas icin AL kullanilir.
        MOV BH,'$'  
        MOV CX,9
        LEA DI,DIZI
         
        
        mov bl,9 ; sayac olarak kullanilacak. 9 dendi, cunku maksimum 9 diez isaretinin degistirilmesi gerekir.
        don:
            REPNE SCASB ;tarama sonucu bulunan karakterden bir sonraki index, DI tarafindan tutulur.
            CMP bl,0
            JE CIK        
            MOV BYTE PTR [DI-1], BH
            dec bl
            jmp don
        
        CIK:
            lea si,DIZI               
            mov cx,9
            
            yazdir:
                mov dl,[si]
                mov ah,02h
                Int 21h
                inc si
                LOOP yazdir
        
            MOV AH,4CH
            INT 21H
    ANA ENDP
    END ANA