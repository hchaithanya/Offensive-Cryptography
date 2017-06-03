BITS 64

%define STDOUT 1
%define SYS_WRITE 1
%define SYS_EXIT 60

section .rodata
	prompt: db "Hello world", 10, 0
	len: equ $-prompt

section .text
	global _start

	_start:

		mov rax, SYS_WRITE
		mov rdi, STDOUT
		mov rsi, prompt
		mov rdx, len

		syscall

		mov rax, SYS_EXIT
		xor rdi,rdi
		syscall