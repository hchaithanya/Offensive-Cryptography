BITS 64

%define BUF_SIZE 20

%define STDIN 0
%define STDOUT 1
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60

section .rodata
	prompt: db "Hello world", 0
	len: equ $-prompt
	lastchar: db "!",0
	last_len: equ $- lastchar



section .bss
    buffer : resq 2



section .text
	global _start

	_start:

		mov rax, [rsp]
		cmp rax,2
		jne .noarg
		jmp .loop

	.loop:

		mov rax, QWORD [rsp + 16]   
		mov r14,rax				    ; retrieve address of filename from stack
        mov rdi, rax
        call strlen
        mov r13,rax

        mov rax, SYS_WRITE
        mov rdi,STDOUT   ;specifies where you want to write it to. here you write to terminal
        mov rsi,r14
        mov rdx, r13
        syscall

        mov rax, SYS_WRITE
        mov rdi,STDOUT   
        mov rsi,lastchar
        mov rdx,last_len
        syscall



		.noarg:
		mov rax, SYS_WRITE
        mov rdi,STDOUT   ;specifies where you want to write it to. here you write to terminal
        mov rsi,prompt
        mov rdx, len
        syscall
        mov rax, SYS_WRITE
        mov rdi,STDOUT   
        mov rsi,lastchar
        mov rdx,last_len
        syscall

		mov rax, SYS_EXIT
		xor rdi,rdi
		syscall

		strlen:
        push rbp
        mov rbp, rsp

        xor rax, rax

        .cmploop:
            cmp BYTE [rdi + rax], 0     ; check if current byte is null
            je .cmpdone                 ; if yes, done
            inc rax                     ; else increment length counter
            jmp .cmploop                ; and continue

        .cmpdone:
            leave
            ret
