.CODE
    ORG 100h
    
    jmp start
    
    counter db ?
    
    start:
        
        mov cx,4
        mov bl,0 
        
        don:   
            inc cx
            dec cx
            dec cx 
            loop don

        ;Loop sunu yapar:
        ;   cx--;
        ;   if(cx != 0)
        ;       goto don;
                
        
        mov ah,4ch
        Int 21h
    
    end start
            
           
    
          