global ft_strcmp ; int ft_strcmp(const char *s1, const char *s2);

section .text

ft_strcmp:
    mov rcx, 0 ; counter = 0

.loop:
    mov al, byte [rdi + rcx] ; al = s1[rcx]
    mov dl, byte [rsi + rcx] ; dl = s2[rcx]
    cmp al, 0 ; if s1[i] null
    je .done
    cmp dl, al ; if s1[rcx] == s2[rcx] 
    jne .done ; jne = jump if not equal
    inc rcx
    jmp .loop

.done:
    movzx rax, al ; rax = s1[rcx] - zero-extend to 64bit register
    movzx rdx, dl ; rdx = s2[rcx] - zero-extend to 64bit register
    sub rax, rdx ; rax = s1[rcx] - s2[rcx]
    ret