datasg segment para 'data'
    text db 'Hasan Fatih Simsek$'    
datasg ends

stacksg segment para stack 'stack'
    db 32 dup(0)
stacksg ends

codesg segment para 'code'
    start:
        mov ax,datasg
        mov ds,ax
        
        lea si,text
        
        ;Orjinal string'i 
        ;karakter karakter 
        ;yazdirir.
        don:
            mov ah,02h
            mov dl,[si]
            Int 21h
                
            inc si
            cmp [si],'$'
            jne don
        
         
        ;Satir atlatilir
        mov ah,02h
        mov dl,0Ah
        Int 21h
        
        
        ;Orijinal string'in
        ;tum harflerini buyutur
        mov cx,18
        lea si,text
        don2:  
            mov al,[si];[si] bir harf tutar. Fakat harfin ascii kodunu tutar.
            
            cmp al,61h
            jb zatenbuyuk
            
            cmp al,7Ah
            ja zatenbuyuk
            
            ;Harf buyutulur.
            sub al,20h  
            
            zatenbuyuk:
            mov ah,02h
            mov dl,al
            Int 21h
            
            inc si
            loop don2
                 
        
        mov ax,4c00h
        Int 21h
codesg ends    
    end start