
;Asagidaki islem su sekilde de yapilabilir:
;---------------------------
;repeat:
;    movsb
;    LOOP repeat
    

;Ya da soyle yapilabilirdi.
;---------------------------
;rep movsb    
        


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
        
        
        lea si,string1
        lea di,string2
        mov cx,10
        
        repeat:
            lodsb ; si'den al'ye
            stosb ; al'den di'ye
            LOOP repeat 
              
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