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
        
        don:
            mov ah,02h
            mov dl,[si]
            Int 21h
                
            inc si
            cmp [si],'$'
            jne don
        
        mov ax,4c00h
        Int 21h
codesg ends    
    end start