; Garrett Johnson OLA1 Haiku

global print_haiku

section .text
print_haiku:
        mov rdx, rsi    ; Argument 2    
        mov rsi, rdi    ; Argument 1 
        mov rax, 1      ; rax set to sys_write
        mov rdi, 1      ; rdi set to 1 for standard output
        syscall         ; invoke operating system
        ret             ; return
