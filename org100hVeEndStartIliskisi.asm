;COM FORMATI - DIRECTIVE'LI
codesg segment
    start:
        ORG 100h
        
        jmp main
        
        number1 db 5
        number2 db 10
        result db ?
        
        main:
        
            mov al,number1
            add al,number2
            mov result,al
            
            mov ax,4c00h
            Int 21h      
     
codesg ends    
    end start ; ORG 100h sayesinde bu satirin
              ; olmasina gerek yoktur.