datasg segment para 'data'
    string1 db '-Computer-'
    string2 db '-Computer-'
    equalNote db 'Strings are equal!$'
    notequalNote db 'Strings are not equal!$'
datasg ends     

stacksg segment para stack 'stack'
    db 64 dup(0)
stacksg ends

codesg segment para 'data'
    start:
    
        mov ax,datasg
        mov ds,ax
        mov es,ax
        
        mov cx,10       ; mov cx,5 denseydi
        lea si,string1
        lea di,string2
        
        repe cmpsb      ; repe cmpsw denirdi
        jne notequal
        
        lea dx,equalNote
        mov ah,09h
        Int 21h
        jmp finish
        
        notequal:
            lea dx,notequalNote
            mov ah,09h
            Int 21h
        
        finish:
        
        mov ah,04h
        Int 21h


codesg ends    

    end start