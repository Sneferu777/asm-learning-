section .data

section .text
global _start
_start:
        mov al,0b11111111 ; 0b means start of a binary
        mov bl,0b0001 ; taking only 8 bits = 1bytes from each reg
        add al, bl ; al will be zero and CF(carry flag) = 1
        adc ah,0        ;it ll add 0 to ah and the Carry as well
        
