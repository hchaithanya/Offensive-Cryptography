



; open a file and then the you get the file pointer which points to that file. So you take a buffer and initialising that 
;buffer with 0. Then read the contents of file into the buffer. Then print the contents of buffer.
BITS64	

extern fclose 
extern fopen
extern fread 
extern memset 
extern printf


section .rodata
	var1: db "Cannot open file",0
	var2: db "r",0
	var3: db "%s", 0
	prompt: db "File is opened",0


section .bss
	buffer: resq 21
	var6: resq 1
	var7: resq 1

section .text 
	global main
	main:

	push rbp
	mov rbp,rsp

	mov r10,rdi  ;rdi has number of arguments
	mov r11, rsi ; has the first argumeent-> ./a.out passed and all other arguments

	cmp r10,2
	jne .exit 

	mov rax,[r11+8]
	mov [var6],rax

	mov rdi, QWORD[var6]
	mov rsi, var2
	call fopen
	cmp rax,0
	je .error

	mov [var7], rax ; file pointer
	mov rdi, buffer
	mov rsi, 0
	mov rdx, 20
	call memset

	mov rdi, buffer ; it is the buf
	mov rcx, QWORD [var7]
    mov rdx, 20
    mov rsi, 1
    call fread 
    mov BYTE [buffer + 20], 0

    mov rsi, buffer
    mov rdi, var3
    call printf

		mov rdi, QWORD [var7]
        call fclose
        mov rax, 0
        jmp .exit


	.error:
	mov rdi,var1
	call printf
	jmp .exit


	.exit:
	xor rax, rax
	leave 
	ret



