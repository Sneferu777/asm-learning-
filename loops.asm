section .data
        list db 1,2,3,4

section .text

global_start
_start:
        mov eax, 0      ; this for indexes
        mov cl, 0       ; this for the sum
loop:
        mov bl, [list + eax]
        add cl, bl
        inc eax
        cmp eax, 4
        je end
        jmp loop

end: 
        mov eax, 1
        mov ebx, 0
        int 0x80
