section .data
    msor db "Entre com uma frase: ", 10
    tamor equ $-msor

section .data
     saida db "Sua mensagem é: ", 10
     len equ $-saida
     
section .data
     sai db "Tem u", 10
     size equ $-sai
     
section .data
     sa db "nao tem u", 10
     siz equ $-sa

segment .bss
    mentr resb 30
    tament resd 1

segment .text
    global _start
    
_start:
    
    ;Exibir mensagem para o usuário entrar com uma frase;
    mov edx, tamor
    mov ecx, msor
    mov ebx, 1
    mov eax, 4
    int 80h
    
    ;Disponibilizar teclado para usuário entrar com a frase.
    mov edx, 30
    mov ecx, mentr
    mov ebx, 0
    mov eax, 3
    int 80h
    
    cmp eax, 1 
    je _start
    
    ;Exibir mensagem 
    mov edx, len
    mov ecx, saida
    mov ebx, 1
    mov eax, 4
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, mentr
    mov edx, 30
    int 80h
    
    cmp [mentr+0], byte "u"
    je sezim
    
    ;Exibir mensagem 
    mov edx, siz
    mov ecx, sa
    mov ebx, 1
    mov eax, 4
    int 80h
    
    jmp final
        
sezim:
    ;Exibir mensagem 
    mov edx, size
    mov ecx, sai
    mov ebx, 1
    mov eax, 4
    int 80h
    
final:
    
    mov eax, 1
    mov ebx, 0
    int 80h
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
