section .data
        pathname dd "~/asm-coding/asm-32/createdbyasm.txt",0
section .text
global _start
_start:
        ;open(pathname,O_RDWR | O_CREAT, 0644)
        mov eax, 5
        mov ebx, pathname
        mov ecx,0x42    ; O_RDWR = 2 + O_CREAT = 0x40 = 0x42
        mov edx, 0644   ; rw_r__r__( read/write for owner, read for group and others)
        int 80h

        mov eax, 1
        mov ebx,0
        int 80h
