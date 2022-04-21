.globl factorial
.section .text

.equ LOCAL_NUM, -8
factorial:
enter $16, $0
cmpq $1, %rdi
jne continue
movq $1, %rax
leave
ret
continue:
movq %rdi, LOCAL_NUM(%rbp)
decq %rdi
call factorial
mulq LOCAL_NUM(%rbp)
leave
ret

