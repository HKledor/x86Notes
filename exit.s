#PURPOSE
#
#

#INPUT: none
#

#OUTPUT
#returns a status code. This can be viewed by typing echo $? after running

#Vars 
#%eax holds sys call num
# % ebx holds return stats

.section .data
.section .text
.globl _Start
_start:
movl $1, %eax #this is linux kernel command number (System call) for exiting
# a program

movl $5, %ebx #This si the status number we will return to OS
#change this around and it will return diff things to echo $?

int $0x80 #this wakes up kernel to run command
