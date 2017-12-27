datasg segment para 'data'
    number1 db 15      ;(!)
    NUMBER1 db 20      ;(!)
    result db ?
datasg ends
 
stacksg segment para stack 'stack'
    db 32 dup(0)
stacksg ends

codesg segment para 'data'
    main proc near
        mov ax,datasg
        mov ds,ax
                      
        mov al,0
        add al,number1  ;(!)
        add al,NUMBER1  ;(!)
        
        mov result,al
        
        mov ax,4C00h
        Int 21h
    main endp
    
codesg ends

    end main

;YANI ASSEMBLY CASE-SENSITIVE DEGILDIR.
;BUYUK VE KUCUK HARF DUYARLI DEGILDIR.