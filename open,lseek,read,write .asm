section .data
        pathname db "text.txt",0
section .bss
        buffer resb 10
section .text
global _start
_start: 
        ;open 
        mov eax, 5
        mov ebx, pathname
        mov ecx, 2
        mov edx, 0644
        int 80h

        cmp eax, 0
        js error        ;jump to error section if SF(signflag) set to 1 so eax is negative < 0

        mov esi, eax ; moving the file descriptor returned by open syscall

        ;lseek(fd, offset, whence)
        mov eax, 19     ;lseek syscall = 19
        mov ebx, esi    ; fd returned by open >= 3
        mov ecx, 0      ; offset = 0
        mov edx, 0      ; SEEK_SET = 0, SEEK_CUR = 1, SEEK_END = 2
        int 80h

        ;read(fd, buffer, count)
        mov eax, 3
        mov ebx, esi    ; the fd returned by open
        mov ecx, buffer
        mov edx, 10
        int 80h
        mov edx, eax    ; store how many bytes were read

        ;write to terminal
        mov eax,4
        mov ebx, 1
        mov ecx, buffer
        int 80h

        ;close(fd)
        mov eax, 6
        mov ebx, esi
        int 80h

        ;exit successfully
        mov eax, 1
        mov ebx, 0
        INT 80h
error:
        mov eax, 1
        mov ebx,1
        int 80h
