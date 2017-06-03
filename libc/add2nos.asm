BITS 64

extern printf
extern scanf

section .rodata
inp: db "%d"
out: db "the sum is %d", 10, 0       ;10 is for newline
prompt: db "enter the number",0

section .bss

num1: resq 1  ;reserve one byte of data 
num2: resq 1

section .txt
global main

	main:

		push rbp;
		mov rbp, rsp

		mov rdi, prompt
		call printf

		mov rdi, inp
		mov rsi, num1
		call scanf

		mov rdi, prompt
		call printf


		mov rdi, inp  ;first arg is rdi
		mov rsi, num2
		call scanf

		mov rdi, out
		mov rsi, QWORD[num1]  ; to move the contents to the reg do QWORD
		add rsi, QWORD[num2]
		call printf

		xor rax, rax
		ret


