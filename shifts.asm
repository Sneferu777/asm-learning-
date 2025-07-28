section .text
global _start
_start:
        mov eax, 1
        shr eax, 1   ; shr : shift right, shl : shift left
                     ; shr is division by N * 2, and shl is multiplication by N * 2
        mov eax, 0xF
        sal eax, 1   ; sal : arithmetic left shift , sar : arithmetic right shift / it s for signed operations 
        
