.globl _start

.section .data

mystring:
.ascii "Hello World!"
mystring_end:
.equ mystring_length, mystring_end - mystring
.section .text
_start:
movq $1, %rax
movq $1, %rdi
movq $mystring, %rsi
movq $mystring_length, %rdx
syscall
movq $60, %rax
movq $0, %rdi
syscall
