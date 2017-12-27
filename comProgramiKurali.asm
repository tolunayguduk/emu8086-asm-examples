codesg segment

start:
    org 100h
    jmp main  ; com programlarinda bu sekilde degisken tanimlamalari atlatilmak zorundadir.  
    
    cumle db "hasanfatihsimsek$"
    
    main:
        lea dx,cumle
        mov ah,09h
        Int 21h

    mov ax, 4c00h
    int 21h  

codesg ends

end start
