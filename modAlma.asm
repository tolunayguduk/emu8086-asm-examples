data segment
    X DB 9
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    MOV AX,data
    MOV DS,AX
    MOV AL,X
    AND X,1


mov ax, 4c00h
int 21h  
    
end start    
ends