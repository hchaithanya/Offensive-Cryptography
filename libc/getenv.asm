BITS 64

extern printf
extern getenv
	
section .text
	global main

	main:
		push rbp
        mov rbp, rsp

        mov r10, rdi
        mov r11, [rsi+8]

        cmp r10,2
        jne .label1
        jmp .loop
        ;mov r13, 0

        .loop:
            mov r10, [rdx+0]
            cmp r10,0
            je .label2
            mov rdi, [r10]
            call getenv
            mov rdi, rax
            call printf
            add rdx,8

      .label1:
        mov rdi, r11
        call getenv 
        cmp rax, 0
        jmp .label2

    .label2:
    	xor rax , rax
    	leave
    	ret