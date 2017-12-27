data segment
    cumle db "bugun hava cok guzel$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax,data
    mov ds,ax
    mov es,ax
    lea si,cumle 
    mov cx,0
    
    ;ekrana cumle yazilir.
    mov ah,09h
    lea dx,cumle
    int 21h
    
    ;ekrana cumle karakter karakter yazilir.
    dongu:
        mov ah,02h ; 09 cumleyi direk yazdirir 02 karakter karakter yazdirir.
        mov dl,[si]
        int 21h
        inc si  
        inc cx ; karakter sayisini sayar
        cmp [si],'$'
        jne dongu     
    
    dongu2:  
        dec si
        mov dl,[si]
        mov ah,02h
        int 21h
        loop dongu2
                                                                
                                                                
                                                                
    ;Bir cumledeki kelime sayisi bosluk sayisindan bir fazladir.      
    mov bx,1
    lea si,cumle
    bosluksay:
        cmp [si],' ' ; cmp [si],20h bosluk'u ifade eder ASCII'de
        jne devamet
        inc bx
        
        devamet:
        inc si
        cmp [si],'$'
        jne bosluksay
    mov ah,02h
    mov dl,bl
    add dl,30h ; rakam yazdirmak icin 30h eklenir. 
    Int 21h
    
    
    lea si,cumle 
    dongu3:
        mov ah,02h 
        mov dl,[si]
        sub dl,20h ; harfler buyutulur.
        inc si  
        inc cx
        int 21h
        cmp [si],'$'
        jne dongu3 
    mov ah,02h
    int 21h
     
     
    
    
mov ax, 4c00h
int 21h  

ends

end start
