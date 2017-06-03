BITS 64

%define BUF_SIZE 20

%define O_RDONLY 0

%define STDIN 0
%define STDOUT 1
%define STDERR 2

%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_OPEN 2
%define SYS_CLOSE 3
%define SYS_EXIT 60

section .rodata
    open_error : db "Cannot open file! Exiting!", 10, 0
    open_error_len : equ $ - open_error
    usage : db "Please specify a FILENAME as argument", 10, 0
    usage_len : equ $ - usage

section .bss
    buffer : resb BUF_SIZE
    fh: resq 1
    filename: resq 1

section .text
    global _start

    _start:
        mov rax, QWORD [rsp]            ; argument count check
        cmp rax, 2
        jne .nofilename

        mov rax, QWORD [rsp + 16]       ; retrieve address of filename from stack
        mov [filename], rax

        mov rax, SYS_OPEN
        mov rdi, [filename]
        xor rsi,rsi
        mov rdx, O_RDONLY
        syscall

        cmp rax,0
        je .openerror
        mov [fh], rax

        mov rax, SYS_READ
        mov rdi, [fh]
        mov rsi, buffer
        mov rdx, BUF_SIZE
        syscall

        mov rax, SYS_WRITE
        mov rdi,STDOUT   ;specifies where you want to write it to. here you write to terminal
        mov rsi,buffer
        mov rdx, BUF_SIZE
        syscall


         mov rax, SYS_CLOSE              ; close file
        mov rdi, [fh]
        syscall

        xor rdi, rdi                    ; exit(0)
        jmp .final

            .nofilename:                    ; display usage message
            mov rax, SYS_WRITE
            mov rdi, STDERR
            mov rsi, usage
            mov rdx, usage_len
            syscall
            mov rdi, 1                  ; exit(1)
            jmp .final

        .final:                         ; exit syscall
            mov rax, SYS_EXIT
            syscall




        .openerror
        mov rax, SYS_WRITE
        mov rdi, STDERR
        mov rsi, open_error
        mov rdx, open_error_len

