datasg segment para 'data'
    string1 db 'Hasan Fatih Simsek'
datasg ends     

stacksg segment para stack 'stack'
    db 64 dup(0)
stacksg ends

codesg segment para 'data'
    start:
    
        mov ax,datasg
        mov ds,ax
        mov es,ax
       
        cld 
        mov al,'a'
        mov bl,'*'
        
        
        mov dx,18
        lea di,string1
        mov cx,18
        
        repeat:
            repne scasb
            jne exit
            
            mov byte ptr [di-1],bl
            
            dec dx
            cmp dx,0
            jne repeat
        
        exit:
        mov cx,18
        lea si,string1
        write:
            mov dl,[si]
            mov ah,02h
            Int 21h   
	        inc si       
            LOOP write
        
        mov ah,4ch
        Int 21h


codesg ends    

    end start