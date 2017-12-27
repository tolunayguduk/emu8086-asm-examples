data segment para 'data'
    sayilar db 1,2,3,4,5,6,90,8,9,10
    enbuyuk db ?
data ends

stack segment para stack 'stack'
    db 64 dup(0)
stack ends

code segment para 'code'
    start:
        mov ax,data
        mov ds,ax
        mov cx,10
        
        lea si,sayilar
        mov enbuyuk,0
        
        compare:
            mov al,[si]
            cmp enbuyuk,al
            jae continue
        
            mov enbuyuk,al 
         
        continue:
            inc si
            loop compare
        
        mov ah,4ch
        Int 21h    
        
code ends
end start