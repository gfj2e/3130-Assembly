; Garrett Johnson OLA1 Haiku

global main                 ; Define main as global
extern print_haiku          ; Make print_haku function from C available to Assembly

section .text
main:                       ; Define main
        mov rdi, haiku      ; Put haiku variable into register rdi
        push rdi            ; Push rdi onto the stack
        call print_haiku    ; call print_haku function
        pop rdi             ; Pop rdi from the stack
        ret                 ; then return

section .data               ; Define the haiku function
haiku: db `life’s little, our heads\nsad. Redeemed, wasting clay\nthis chance. Be of use.\nBy Ravi Shankar\n`