BITS64

extern printf 
extern scanf 

section .rodata
out1: db "first one is greater", 10, 0
out2: db "second one is greater", 10, 0
out3: db "equal", 10, 0
inp : db "%d"
prompt : db "enter the number", 0

section .bss
num1 : resq 1
num2 : resq 1

section .txt
global main
	
	main:
		push rbp,
		mov rbp, rsp

		mov rdi, prompt
		call printf

		mov rdi, inp
		mov rsi, num1
		call scanf

		mov rdi, inp
		mov rsi, num2
		call scanf

		mov r9,QWORD[num1]
		cmp r9, QWORD[num2]
		jle .case1
		jmp .case2


			.case1:
				mov r9,QWORD[num1]
				cmp r9, QWORD[num2]
				je .equal
				mov rdi, out2
				call printf
				jmp .exit

			.case2:
				mov rdi, out1
				call printf
				jmp .exit

			.equal:
				mov rdi, out3
				call printf
				jmp .exit
		.exit:
			xor rax,rax
			leave 
			ret