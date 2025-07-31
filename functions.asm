section .data

section .text
global _start
addTwo:
        ADD EAX, EBX
        RET

_start:
        mov eax,2
        mov ebx,3
        call addTwo
        mov eax, 1
        int 80h
