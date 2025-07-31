section .data 
section .text
global _start 
addTwo:    
push ebp            ; save old frame  
mov ebp, esp        ; create new frame  
mov eax, [ebp + 8]  ; load 1st argument (top of stack)  
mov ebx, [ebp + 12] ; load 2nd argument (next) 
add eax, ebx        ; result = eax + ebx
pop ebp             ; restore old frame    
ret                 ; return 
_start:     
push 4              ; arg2 = 4
push 3              ; arg1 = 3    
call addTwo         ; call function   
add esp, 8          ; clean up 2 args  
mov eax, 1    
int 80h
