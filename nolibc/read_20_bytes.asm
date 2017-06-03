BITS 64

%define BUF_SIZE 20
%define STDIN 0
%define STDOUT 1
%define STDERR 2

%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_OPEN 2
%define SYS_CLOSE 3
%define SYS_EXIT 60

section .rodata
	open_error: db "Cannot open file", 10,0
	open_error_len: eq $-open_error
	usage : db "Please specify a FILENAME as argument", 10, 0
    usage_len : equ $ - usage
    
section .bss
    buffer : resb BUF_SIZE
    fh: resq 1
    filename: resq 1



