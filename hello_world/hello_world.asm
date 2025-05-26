section .data
	msg db "Hello, world!", 0xA
	len equ $ - msg

section .text
	global _start

_start:
	; write(1, msg, len)
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	; return 0
	mov eax, 1
	xor ebx, ebx
	int 0x80

