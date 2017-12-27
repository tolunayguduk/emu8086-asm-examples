codesg segment para 'code'
    
    ORG 100h
    
    jmp start
    
    dizi db 1,2,3,20,5,6,32,8,9,10
    enbuyuk db ?
    

start:
    
    lea si,dizi
    
    mov al,[si]
    mov enbuyuk,al
    mov cx,9
    
    repeat:    
        inc si
        cmp al,[si]
        jb yeniBuyuk
        jmp ayniBuyuk
        yeniBuyuk:
            mov bl,[si]
            mov enbuyuk,bl 
            mov al,enbuyuk
        ayniBuyuk:
        LOOP repeat
    
    
    mov ah,4ch
    Int 21h
    
    
codesg ends
    end start