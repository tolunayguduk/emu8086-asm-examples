datasg segment
    cumle db "hasan fatih simsek$"
datasg ends

stacksg segment
    dw   128  dup(0)
stacksg ends

codesg segment
start:

    mov ax,datasg
    mov ds,ax
    
    ;imlec konumlandirilir 
    MOV AH,02H ;fonsiyon
    MOV BH,00H ;sayfa numarasi(00H-03H)
    MOV DH,5H  ;satir numarasi
    MOV DL,15H ;sutun numarasi
    INT 10H    ;10 Nolu BIOS kesmesi
    
    ;ekran silinir
    MOV AX,0600H ; 06:fnksiyon 00:satir
    MOV BH,3FH   ; 3:zemin F:karakter rengi
    MOV CX,0000H ; ust sol kose koordinati
    MOV DX,184FH ; alt sag kose koordinati
    INT 10H
    
    ;ekrana yazilir
    mov ah,09h
    lea dx,cumle
    Int 21h

mov ax, 4c00h
int 21h  

codesg ends

end start
