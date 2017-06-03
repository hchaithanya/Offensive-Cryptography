BITS 64

extern printf

section .rodata
    
    hello_world : db "Hello world!",10,0

section .text
    global main

    main:
        push rbp
        mov rbp, rsp
        mov rdi, hello_world
        call printf
xor rax,rax
leave
ret

