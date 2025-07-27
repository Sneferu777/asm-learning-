section .data

section .text
global _start
_start:
        mov al,2
        mov bl,3
        mul bl          ;it needs only one operator bcuz it assigns the first operator to what's in eax bcuz its accumulator
                        ;MUL is used for unsigned multiplication
        mov al, 0xFF
        mov bl, 2
        MUL bl          ; this will give -2 bcuz the result is greater than al

        mov al, 0xFF ; 255
        mov bl, 2 
        imul bl         ; i mul will interpret the value of eax as negative so 0xff(255) will be -1

        mov eax,1
        mov ebx,0
        int 0x80 
