section .text
global _start
_start:
        mov eax, 0b1010 ; 10
        mov ebx, 0b1100 ;12
        and eax,ebx     ; 8

        mov eax, 0b1010
        or eax, ebx

        mov eax,1
        mov ebx,0
        int 80h
