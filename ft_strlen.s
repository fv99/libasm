global ft_strlen ; dont need _start or syscalls - will be called by C function

; system V ABI rule - first argument of called function goes in rdi 

section .text

ft_strlen:
    mov rax, 0 ; syscall read

.loop:
    cmp byte [rdi + rax], 0 ; rdi = pointer to string + counter, compare byte to 0 null terminator, set EFLAGS = 1
    je .done ; jump to if equal - cmp writes to EFLAGS register - if EFLAGS = 1, jump to .done
    inc rax ; increment our counter
    jmp .loop ; back to start of loop 

.done:
    ret ; returns rax (return register)
