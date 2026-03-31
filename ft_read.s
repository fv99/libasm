global ft_read ; ft_write(fd, buf, count)

section .text

ft_read:
  mov rax, 0 ; set syscall into read
  syscall
  cmp rax, 0 ; check if ERRNO
  jl .error ; if lower than 0, handle error
  ret

.error:
  mov rax, -1 ; return -1
  ret