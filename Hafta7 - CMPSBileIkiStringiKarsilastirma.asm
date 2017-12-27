;SOR1:
; Iki string esit degil seklinde program
; sonuclaniyor. BH 1 olmuyor, 0 oluyor?
;CEVAP:
; Extra Segment ifadesi kullanilinca program
; calismasi duzeliyor. ES kullanmak gerekli.


;SOR2:
; Karsilastirilan sey [SI] ve [DI] degil mi?
; Fakat memory,memory ile kiyaslanamazdi?
; Burada kiyaslanmasi bir istisna mi? 
;Cevap:
; CMPSB ifadesi ile aslinda [SI] ve [DI] karsilastiriliyor ama
; arkaplanda bir araci kaydedici kullaniliyor. Yani pratik sekilde
; bu arkaplanda donen olay tek ifade ile gerceklestiriliyor.   

data segment
    NAME1 DB 'assemblers'
    NAME2 DB 'assemblers'
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax,data
    mov ds,ax
    mov es,ax;(!) Bu olmayinca program duzgun calismiyor.
    
    
    CLD ; string operatoru cmpsb'ye soldan saga dogru islem yaptirir.
    MOV CX,9
    
    LEA SI,NAME1
    LEA DI,NAME2
    
    REPE CMPSB ; (Esit oldugu muddetce) ve (cx > 0 oldugu muddetce) karsilastir
    JNE ESITDEGIL
    MOV BH,01
    JMP SON
    
    ESITDEGIL:
        MOV BH,0
    SON:

mov ax, 4c00h
int 21h  

ends

end start
