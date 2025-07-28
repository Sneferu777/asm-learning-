section .data

section .text 
global _start
_start:
        mov eax,5
        mov ebx,2
        div ebx         ;so div is like mul, the default first operator is eax
                        ;and the reminder is in EDX

        mov eax, 0xFF
        idiv ebx        ;so as IMUL, IDIV do signed division so what's in EAX is interpreted as negativ so 0xFF(255) in EAX is -1

        mov eax ,1
        mov ebx, 0
        int 80h
