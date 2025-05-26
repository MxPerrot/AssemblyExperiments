section .data

	; Message 1
	msg1 db "Hello, world!", 0xA
	len1 equ $ - msg1

	; Message 2
	msg2 db "Goodbye, world!", 0xA
	len2 equ $ - msg2

	; NOTE: the calculation of len uses $ which means relative to current offset.
	; This means that len calc must be done right after 

section .text
	global _start

_start:
	; print msg1
	mov eax, 4	; instruction is write
	mov ebx, 1	; to stdout
	mov ecx, msg1	; the content of msg1
	mov edx, len1	; of length len1
	int 0x80	; syscall the instruction

	; print msg2
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80

	; end program
	mov eax, 1
	xor ebx, ebx
	int 0x80

