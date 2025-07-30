extern printf
extern exit
section .data
        msg db "hello from C to asm", 0         ;msg is the value the printf will print and fmt is the format
        fmt db "Output is : %s",10,0            ;10 or 0xA is the new line character(\n) and 0 is NULL terminator'\0'
section .text
global main
main:
        push msg        ; we use push to push msg into the stack so msg will be accessible to printf 
        push fmt        ; we pushed msg first cuz stack is LIFO so we need the format first
        call printf
        push 0
        call exit
 
