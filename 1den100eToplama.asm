.MODEL HUGE
.DATA
    RESULT DW ?
.STACK 64
.CODE
    MOV AX,@DATA
    MOV DS,AX
               
    mov ax,00
    mov cx,100
    
    start:
        add ax,cx
        LOOP start
        
    mov RESULT,ax
      
    MOV AH,4CH
     
    INT 21H 
      