section .data
	prompt	db	"Enter a word: ", 0	; 0 = read from stdin
	prompt_len	equ $ - prompt

section .bss
	buffer	resb 100	; reserve bytes (100 of them) for user input

section	.text
	global _start

_start:
	; print prompt
	mov eax, 4
	mov ebx, 1
	mov ecx, prompt
	mov edx, prompt_len
	int 0x80

	; read buffer
	mov eax, 3	; syscall read
	mov ebx, 0	; fd: stdin
	mov ecx, buffer	; store input in buffer variable
	mov edx, 100	; max bytes
	int 0x80
	mov esi, eax	; save length of input in esi

	; print buffer
	mov eax, 4
	mov ebx, 1
	mov ecx, buffer
	mov edx, esi	; use size of input as len of print
	int 0x80

	; end program
	mov eax, 1
	xor ebx, ebx
	int 0x80
