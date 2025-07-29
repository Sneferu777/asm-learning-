section _data

section _text 
global _start
_start:

        mov eax, 3
        mov ebx, 2
        cmp eax,ebx ; if eax - ebx == 0 its equal, else if positive then eax is bigger than ebx, else ebx is bigger than eax
        jl lesser       ; jump if eax is less than ebx to lesser
        jmp end         ; jmp always execute so it represents else here

lesser: 
        mov ecx, 1
end:
        int 80h
