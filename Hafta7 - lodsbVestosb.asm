;Asagidaki LODSB ve STOSB birlikte 
;MOVSB yapmis olmaktadir. Yani bu 
;iki ifade yerine sadece MOVSB yazsak
;yine ayni islemi yapmis oluruz.
;RAM ve CPU arasinda doldur bosalt yapiyoruz.

.MODEL SMALL
.CODE
    ORG 100H
    BAS: 
        JMP SHORT KOPYALA
        KAYNAK DB 'BILGISAYARCILAR'
        HEDEF DB 'ELEKTRONIKCILER'
       
    KOPYALA PROC NEAR
        CLD
        MOV CX,15
        LEA SI,KAYNAK
        LEA DI,HEDEF
        TEKRAR:
        LODSB
        STOSB
        LOOP TEKRAR
        MOV AH,4CH
        INT 21H
    KOPYALA ENDP
   
    END BAS