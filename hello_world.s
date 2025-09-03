section .data
    msg db "Hello world!", 10

section .text
    global _main

_main:
    mov rax, 0x2000004      ; write
    mov rdi, 1              ; fd = stdout
    mov rsi, msg            ; buffer
    mov rdx, 13             ; length
    syscall

    mov rax, 0x2000001      ; exit
    xor rdi, rdi
    syscall
