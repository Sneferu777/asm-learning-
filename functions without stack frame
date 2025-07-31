section .data
section .text 
global _start 
addTwo:
ADD EAX, EBX     ; EAX = EAX + EBX     
RET              ; return to caller  
_start:     
mov eax, 2       ; set first number
mov ebx, 3       ; set second number
call addTwo      ; result = 2 + 3 → EAX = 5   
mov eax, 1       ; syscall: exit     
int 80h          ; exit(1)
