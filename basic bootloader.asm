ORG 0x7c00      ; origin tells NASM at what mem addr your code will be loaded and executed
                ; we use 0x7c00 , when a pc boots form a disk the BIOS loads the first 512 bytes (the boot sector) into memory
                ; at address 0x7c00, then jumps to it 
BITS 16


main:
        mov ax,0
        mov ds, ax
        mov es, ax
        mov ss, ax

        mov sp, 0x7c00
        mov si, os_boot_msg
        call print
        hlt             ; halts the CPU  until next hardware interrupt, after bootloader is done, nothing else is loaded so the CPU would
                        ; continue executing garbage

halt:
        jmp halt        ;loops forever to prevent system crash

print:
        push si
        push ax
        push bx

print_loop:
        LODSB           ; load string byte , load a bytes from [ds:si] into al then increment si(or decrement if DF is set
                        ; it s a clen way to loop through a string one character at a time
        or al,al
        jz done_print

        mov ah, 0x0e    ; teletype output
        mov bh, 0       ;page number usually 0
        int 0x10 ; video interrupt

        jmp print_loop

done_print:
        pop ax
        pop bx
        pop si
        ret


os_boot_msg: db 'Our os has loaded!',0xA,0

TIMES 510-($-$$) DB 0   ; filling the first 510 bytes with 0
DW 0AA55H               ; filling the last word or 2 bytes (the Magic Bytes) with 0xAA55H , means write the boot signature at byte 511-512
                        ; wichi tells " yes i m a bootloader"
