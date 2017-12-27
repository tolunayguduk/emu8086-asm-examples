.DATA       
    number1 db 5
    number2 db 10
    result db ?

.STACK 32

.CODE
    main proc near  ;far deyince hata veriyor
        CALL sum
        
        mov ah,4ch
        Int 21h
    main endp
    
    sum proc near   ;far deyince hata veriyor
        mov ax,@DATA
        mov ds,ax
        mov es,ax ; ds'in yetmedigi durumda extra segment(es) kullanilir.
        
        
        mov al,number1
        add al,number2
        
        mov result,al
        
        RET
    sum endp
    
    end main