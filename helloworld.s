        .data
msg:   .asciiz "Hello World"

        .text
        .globl main
main:   li $v0, 4       # syscall 4 (print_str)
        la $a0, msg     # argument:  ptr to string
        syscall         # print the string      
        jr $ra          # return to caller
