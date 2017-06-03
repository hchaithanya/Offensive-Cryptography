BITS 64

extern printf
extern scanf

section .data
    var1 :    dq 100

section .rodata
    var2 :    db "%d", 10, 0

section .text
    global main

    main:
        push rbp
        mov rbp, rsp

        .label1:
            mov rsi, QWORD [var1]
            mov rdi, var2
            call printf
            sub QWORD[var1], 2
            cmp QWORD [var1], 0
            jg .label1
            jmp .label2

        .label2:
            xor rax, rax
            leave
            ret
