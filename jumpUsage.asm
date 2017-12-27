datasg segment para 'data'
    number1 DB 5 
    result db ?
datasg ends
 
stacksg segment para stack 'stack'
    db 32 dup(0)
stacksg ends

codesg segment para 'data'
    main proc far 
        Assume CS:codesg,SS:stacksg,DS:datasg
        
        mov ax,datasg
        mov ds,ax
                      
        mov al,0
        add al,number1 
        
        jmp ziplamaNoktasi
        add al,5
        
        ziplamaNoktasi:
            mov result,al
            
            mov ax,4C00h
            Int 21h
    
    
    main endp
    
codesg ends

    end main
