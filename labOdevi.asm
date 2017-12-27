
;LAB ODEVI 
;Girilen 10 sayidan 4 ile tam bolunenlerin toplamini veren program.

.MODEL SMALL
.STACK 128
.DATA
    result db ?
.CODE
    ANA PROC FAR
        MOV AX,@DATA
        MOV DS, AX
        
        
        mov bl,10 ; Dongu miktari
        mov cl,4 ; Bolum degeri
        mov result,0
        
        tekrar:
            mov ah,01h
            int 21H
            
            sub al,30h ; Girilen sayiyi ortaya cikariyor.
            mov dl,al  ; orijinal deger korunur
            
            
            div cl; Kalan: ah , Bolum: al
            cmp ah,0
            jne atla
                add result,dl
            atla:
            dec bl
            jne tekrar
        
        
        
        MOV AH,4CH
        INT 21H
    ANA ENDP
    
    
   END ANA