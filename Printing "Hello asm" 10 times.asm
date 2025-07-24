section .data
        msg db "Hello asm", 0xA; newline
        len equ $ - msg; equ define cst and $ is current addr
section .text
        global _start
_start:
        mov edi, 10     ;loop counter

        loop_start:

        ;write(1, msg, len)
        mov eax, 4      ;sys write
        mov ebx, 1      ; fd of stdout
        mov ecx, msg
        mov edx, len
        int 0x80        ; make syscall
        dec edi
        jnz loop_start

        ;exit(0)
        mov eax, 1      ; syscall for exit
        xor ebx, ebx    ; exit code = 0
        int 0x80
