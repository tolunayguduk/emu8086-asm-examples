datasg segment para 'data'
    SAYI1 DB 45
    SAYI2 DB 30
    SONUC DB ?
datasg ends

stacksg segment para stack 'stack'
    db 32 dup(0)
stacksg ends
 
 
codesg segment para 'code'
        
        ana proc
            CALL hesapla
            
            mov ah,4ch
            Int 21h
        ana endp
        
        
        ;SONUC degiskeni 0 cikiyor, Neden?
        
        hesapla proc near
            mov ax,datasg
            mov ds,ax
            
            mov al,SAYI1
            mov bl,SAYI2
            add al,bl
            
            mov SONUC,al
            
            
            RET
        hesapla endp  
        
        
        end ana
codesg ends