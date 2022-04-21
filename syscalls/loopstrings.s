.globl _start

.section .data
mystring:
.ascii "Loops R Fun\n"
mystring_end:
.equ mystring_length, mystring_end - mystring
times:
.quad 5
.section .text
_start:
movq $1, %rax
movq $1, %rdi
movq $times, %rcx
cmpq $0, %rcx
je complete
loop:
movq times, %rcx
movq $1, %rax
movq $1, %rdi
movq $mystring, %rsi
movq $mystring_length, %rdx
decq %rcx
movq %rcx, times
syscall
loopq loop
complete:
movq $60, %rax
movq $0, %rdi
syscall
