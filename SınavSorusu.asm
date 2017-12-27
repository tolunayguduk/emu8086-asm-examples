.CODE
    ORG 100h
    
    jmp start
    
    tablo db 1,2,3,4,5,6,7,8,9,10
    result db ? 
    
    start:
    
        lea si,tablo
        mov cx,10
        mov result,0
        mov bl,0
          
        don:
            mov bl,[si]
            shr bl,4
            jnc eklenmeyecek
            mov al,[si]
            add result,al
           
            eklenmeyecek:
            inc si 
            LOOP don
                                
        
        mov ah,4ch
        Int 21h
    
    end start