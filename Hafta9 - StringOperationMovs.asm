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
        
        cld
        lea si,string1
        lea di,string2
        mov cx,10      ; mov cx,5   ; Eger boyle denseydi...
        
        rep movsb      ; rep movsw  ; boyle denirdi ve ayni sonuc uretilirdi.
        
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