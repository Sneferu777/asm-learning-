section .bss    ; block starting symbol
        num RESB 3      ; reserve bytes

section .data
        num2 DB 3 DUP(2) ; a variable of one bytes with 3 memory slots and duplicate the value 2 3 times in them

section .text
global _start
_start:
        mov bl, 1
        mov bl, [num2]
        mov [num], bl
        mov [num+1], bl
        mov [num+2], bl

        mov eax, 1
        INT 80h
