data segment
    SAYI1LSB DW 0BC62H ; 2 byte'lik deger. Adres ilerletilecegi sira 2 byte ilerletilmelidir.
    SAYI1MSB DW 0123H  ; 2 byte ilerledi mi buranin degerleri pointer'da gorunur.
                       ; Cunku SAYI1LSB'den sonra SAYI1MSB tanimlandigi icin bellekte bu ikisi
                       ; birbirinin devami seklinde siralidir.
    
    SAYI2LSB DW 553AH  ; 2 byte'lik deger. Adres ilerletilecegi sira 2 byte ilerletilmelidir.
    SAYI2MSB DW 0012H  ; 2 byte ilerledi mi buranin degerleri pointer'da gorunur.
                       ; Cunku SAYI1LSB'den sonra SAYI1MSB tanimlandigi icin bellekte bu ikisi
                       ; birbirinin devami seklinde siralidir.
    
    SONUCLSB DW ?
    SONUCMSB DW ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    LEA SI,SAYI1LSB
    LEA DI,SAYI2LSB

    
    MOV CX,02 ; DONGU SAYISI 2
    
    CLC ; ELDEYI SIFIRLA C=0
    
    TEKRAR:
        MOV AX,[SI]
        ADC AX,[DI]  ; Ilk iterasyondaki toplamadan gelen carry, ikinci iterasyonda ADC ile eklenir.
        CMP cx,02
        je lsbTopla
        mov SONUCMSB,AX
        jmp atla
        
        lsbTopla:
            MOV SONUCLSB,AX
        
        atla:
        
        INC SI
        INC SI
        
        INC DI
        INC DI
        
        INC BX
        INC BX 
        
        LOOP TEKRAR

mov ax, 4c00h
int 21h  

ends

end start