data segment
    result db ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start: 
    mov ax,data
    mov ds,ax
               
    mov al,10100000B
    rcl al,01
    
    mov result,al

mov ax, 4c00h
int 21h  

ends

end start
