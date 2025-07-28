section .data
 
section .bss
        len equ 120
        msg resb len
section .text
global _start
_start:
        mov eax, 3
        mov ebx,0
        mov ecx, msg
        mov edx, len
        int 80h

        mov edx, eax ; eax has the number of bytes read
 
        mov eax, 4
        mov ebx,1
        mov ecx, msg
        ;edx is already set
        int 80h

        mov eax, 01h            ; exit()
        xor ebx, ebx            ; errno
        int 80h
