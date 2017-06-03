BITS64

extern printf
extern scanf

section .rodata
inp : db "%d",0
prompt: db "Enter number",0

section .bss
num1: resq 1
num2: resq 1

section .text
	global main
	main:

	push rbp
	mov rbp,rsp

	mov rdi, prompt
	call printf

	mov rdi, inp
	mov rsi, num1
	call scanf

	mov rdi, inp       ; dont give r8-10
	mov rsi, num2
	call scanf
	mov r14, QWORD[num1]
	mov r13, QWORD[num2]
		.loop:
			
			cmp r14, r13
			jg .exit
			mov rdi, inp
			mov rsi, r14
			call printf
			inc r14
			jmp .loop
			


		.exit:
			xor rax,rax
			leave 
			ret
			


