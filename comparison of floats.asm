section .data
        x dd 3.14
        y dd 2.1
section .text
global _start
_start:
        movss xmm0, [x]
        movss xmm1, [y]
        ucomiss xmm0, xmm1      ;cmp work only for int values
                                ; JL(jump less than) becomes JB(jump below) and JG(jump greater than) becomes JA(jump above)
        ja greater
greater:
        mov eax,1
        xor ebx, ebx
        int 80h
