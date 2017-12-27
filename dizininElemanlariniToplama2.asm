data segment
    DIZI DB 5, 6, 7, 8, 9, 0,-6,-9, 3, 8
    RESULT DB ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
    MOV AX,data
    MOV DS,AX
    
    LEA SI,DIZI
    MOV AL,0
    MOV CX,10
        
    START:
        MOV BL,[SI]
        ADC AL,BL
        INC SI
        LOOP START
        
    MOV RESULT,AL
    
mov ax, 4c00h
int 21h  

ends

end start
         
         
         
