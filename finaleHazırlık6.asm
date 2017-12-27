data segment
    string1 db 'hasa2'
    string2 db 'hasan'
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov cx,5
    
    lea si,string1
    lea di,string2
    
    repe cmpsb 
    jne esitDegil
    
    mov bh,1
    jmp son
    
    esitDegil:
        mov bh,0
    son:    
    

mov ax, 4c00h
int 21h  

ends

end start
