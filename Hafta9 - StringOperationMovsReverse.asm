datasg segment para 'data'
    string1 db '-Computer-'
    string2 db 'Electronic'
datasg ends     

stacksg segment para stack 'stack'
    db 64 dup(0)
stacksg ends

codesg segment para 'data'
    start:
    
        mov ax,datasg
        mov ds,ax
        mov es,ax
        
        std
        lea si,string1+10
        lea di,string2+10
        mov cx,11      ; rep movsb, transferi yapmadan once cx'i bir azalttigindan 10 degil de 11 dendi.
        
        rep movsb      ; cx,0 oldu mu transfer yapilmaz. 10 denmis olsaydi 1 karakter transfer edilememis olacakti.
        
        mov cx,10     
        lea si,string2
        
        write: 
            mov dl,[si]
            mov ah,02h
            Int 21h 
            inc si
            LOOP write
            
        
        mov ah,04h
        Int 21h


codesg ends    

    end start