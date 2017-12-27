datasg segment para 'data'
    SAYI1 DB 45
    SAYI2 DB 30
    SONUC DB ?
datasg ends

stacksg segment para stack 'stack'
    db 32 dup(0)
stacksg ends
 
 
codesg segment para 'code'
    
    hesapla proc far
        mov ax,datasg
        mov ds,ax
        
        mov al,SAYI1
        mov bl,SAYI2
        add al,bl
        
        mov SONUC,al
        
        mov ah,4ch
        Int 21h
    
    hesapla endp
    end hesapla
    
codesg ends
