global ft_strcpy ; ft_strcpy(rsi, rdi)

section .text

ft_strcpy:
    mov rax, rdi ; save dest pointer for return
    mov rcx, 0 ; counter = 0

.loop:
    mov dl, byte [rsi + rcx]; read lowest byte from rsi (src) into dl
    mov byte [rdi + rcx], dl ; copy byte to dl (dest)
    cmp dl, 0 ; if we copied null terminator then exit
    je .done
    inc rcx
    jmp .loop

.done:
    ret; returns rax

; rdx  = full 64 bits
; edx  = lower 32 bits
; dx   = lower 16 bits
; dh   = bits 8-15 (high byte of dx)
; dl   = bits 0-7  (lowest byte)