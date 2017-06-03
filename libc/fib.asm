extern printf
extern atoi

section .rodata
	var2: db "%lld", 10, 0
	
section .bss
	num_x: resq 1
	num_y: resq 2
	

section .text
	global main

	main:
		push rbp                    ; setup stack frame
        mov rbp,rsp
        mov r13,rdi
        mov r15,rsi
        


        outer:
        
        cmp r13,1
        je exit 
        mov rdi,QWORD[r15+8]
        call atoi
        mov r11,rax
        add r15,8           ; checking for number of arguments
        jmp fib


        fib:
	        cmp r11, 0 
	        jle fib_negative     			; num<0, then jump
	        
	        cmp r11,1
	        je fib_one
	        cmp r11,2
	        je fib_two

	        mov QWORD[num_x], 0
	        mov QWORD[num_y], 1
	        xor rcx,rcx
	        mov rcx,3       	;counter variable= rcx

	        	jmp iter
	        	iter:
		        	cmp rcx, r11    ;i<=n
		        	jle loop1
		        	jmp display
	        		loop1:
			        	mov r12, QWORD[num_x] ;r12= result
			        	add r12, QWORD[num_y]  ;x+y
			        	mov r14, QWORD[num_y]
			        	mov QWORD[num_x], r14 ;x=y
			        	mov QWORD[num_y], r12 ;y=result

			        	inc rcx
		        		jmp iter


		 fib_negative:
		 mov r12, -1  
		 jmp display 
		 jmp exit    		

		 
		fib_one:
		mov r12,0
		jmp display
		jmp exit

		fib_two:
		mov r12,1
		jmp display
		jmp exit

		display:
		 mov rsi,r12
		 mov rdi,var2
		 call printf
		 dec r13
		 jmp outer


	    exit:    
		 xor rax,rax
		 leave
		ret



	        
		       






