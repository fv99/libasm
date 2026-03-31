global ft_write ; ft_write(fd, buf, count)

section .text

ft_write:
  mov rax, 1 ; set syscall into write
  syscall
  cmp rax, 0 ; check if ERRNO
  jl .error ; if lower than 0, handle error
  ret

.error:
  mov rax, -1 ; return -1
  ret