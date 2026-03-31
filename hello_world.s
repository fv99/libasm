global _start ; for linker

section .text ; executable

_start:
  mov rax, 1        ; syscall 1 = write
  mov rdi, 1        ; first arg - file descriptor 1 - STDOUT,
  mov rsi, msg      ; second arg - pointer to our string msg
  mov rdx, msglen   ; 14 bytes - len of "Hello, world!\n"
  syscall           ; write 14 bytes to stdout

  mov rax, 60       ; syscall 60 = exit
  mov rdi, 0        ; sets arg to code 0 EXIT_SUCCESS
  syscall           ; kernel exits

section .rodata ; read only data (nasm instructions)
  msg: db "Hello, world!", 10 ; db = define bytes, 10 = ascii newline
  msglen: equ $ - msg ; equ = #define in C, $ = current position - msg = length