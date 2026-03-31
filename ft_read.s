global ft_read ; ft_write(fd, buf, count)
extern __errno_location ; call this to get pointer to errno from libc

section .text

ft_read:
  mov rax, 0 ; set syscall into read
  syscall
  cmp rax, 0 ; check if ERRNO
  jl .error ; if lower than 0, handle error
  ret

.error:
  neg rax ; set errno to positive
  push rax ; push errno onto stack
  call __errno_location wrt ..plt; ; wrt plt to fix dumbass linker error
  pop rdx ; get our errno into rdx
  mov [rax], edx ; errno is a 32-bit number - need the second part of register
  mov rax, -1 
  ret