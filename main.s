
exit    = 93
write   = 64
read    = 63

.section .data 

hello:  .asciz "Hello, what is your name: "
size =  .-hello

salutation: .asciz "Welcome "

name: .space 30

.section .text 

.globl _start

_start:     

        li      a0, 1           # 1 is the default fileno for stdout
        la      a1, hello       # address of string
        li      a2, size        # size of string
        li      a7, write       # number of syscall 'write'
        ecall                   # enviromental call (interrupt)

        li      a0, 0           # 0 is the default fileno for stdin
        la      a1, name        # address of string
        addi    a1, a1, -1      # a little hack to join strings
        li      a2, 30          # size of string
        li      a7, read        # number of syscall 'read'
        ecall                   # enviromental call (interrupt)

        li      a0, 1           # 1 is the default fileno for stdout
        la      a1, salutation  # address of string
        li      a2, 30          # size of string
        li      a7, write       # number of syscall 'write'
        ecall                   # enviromental call (interrupt)

        li      a0, 0           # exit code
        li      a7, exit        # number of syscall 'exit'
        ecall                   

