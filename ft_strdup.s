global ft_strdup; char *ft_strdup(const char *s)
extern malloc
extern ft_strlen
extern ft_strcpy

section .text

ft_strdup:
  push rbx ; each call will destroy these registers values
  push r12 ; so move these on the stack
  mov rbx, rdi ; save string pointer in rbx (survives calls)
  call ft_strlen
  mov r12, rax ; get strlen into r12
  lea rdi, [r12 + 1] ; lea = math without accessing memory, rdi = lenght + null terminator

  call malloc wrt ..plt ; mallocs with lenght rdi
  cmp rax, 0 ; check if malloc failed
  je .done

  mov rdi, rax ; move our malloced pointer to rdi
  mov rsi, rbx ; move our string to rsi
  mov rbx, rax ; move malloced pointer to save between calls
  call ft_strcpy
  mov rax, rbx

  .done:
    pop r12
    pop rbx
    ret