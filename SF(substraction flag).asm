section .data

section .text
global _start
_start:
        mov eax, 3
        mov ebx, 5
        sub eax, ebx ; sub is for substraction , so eax now is -2 so the SF(substraction flage) = 1 which means that the value is negative

        mov eax, 1
        mov ebx, 0
        int 80h
