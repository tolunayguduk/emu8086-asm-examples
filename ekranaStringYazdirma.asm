data segment
    MESAJ DB 'Hasan Fatih Simsek$'
data ends

stack segment
    dw   128  dup(0)
stack ends

code segment
start:
    MOV AX,data
    MOV DS,AX
    
    
    LEA DX,MESAJ ; Mesajin ofset adresi DX kaydecisine alýnýr
    MOV AH,10
    INT 21H  

code ends

end start
