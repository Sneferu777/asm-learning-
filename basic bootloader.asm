; boot.asm
BITS 16                 ; We're working in 16-bit real mode
ORG 0x7C00              ; BIOS loads boot sector to this address

start:
    mov si, msg         ; Load address of string into SI
    call print_string   ; Call function to print string

hang:
    hlt                 ; Halt CPU to save power
    jmp hang            ; Infinite loop

; === Function: print_string ===
; Prints null-terminated string pointed to by SI using BIOS interrupt
print_string:
    mov ah, 0x0E        ; Teletype mode (INT 10h AH=0x0E)
.next_char:
    lodsb               ; Load byte at DS:SI into AL, advance SI
    or al, al           ; Check for null terminator
    jz .done
    int 0x10            ; BIOS call to print AL to screen
    jmp .next_char
.done:
    ret

msg db "Hello, Sneferu's Bootloader!", 0  ; Null-terminated string

; Fill remaining bytes to make total size = 510
times 510 - ($ - $$) db 0

; Boot signature (must be 0x55AA at the end)
dw 0xAA55
