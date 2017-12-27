data segment
    cift db 'cift$'
    tek db 'tek$'
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    
    mov ax,data
    mov ds,ax
    
    mov ah,01h
    Int 21h
   
    clc
    
    
    sbb al,30h
    
        
    shr al,1
    jc tektir
    jmp cifttir
    
    tektir:
        lea dx,tek
        mov ah,09h
        Int 21h
        jmp son
    cifttir:
        lea dx,cift
        mov ah,09h
        Int 21h
    son:   
        
    

mov ax, 4c00h
int 21h  

ends

end start
