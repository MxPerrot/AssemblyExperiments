section .data
    msg1 db "Hello!", 0xA
    len1 equ $ - msg1

    msg2 db "This is a reusable print function.", 0xA
    len2 equ $ - msg2

section .text
    global _start

_start:
    ; Print msg1
    mov ecx, msg1
    mov edx, len1
    call print

    ; Print msg2
    mov ecx, msg2
    mov edx, len2
    call print

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

; ----------------------------------------
; print function (uses ecx and edx)
; ----------------------------------------
print:
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret
