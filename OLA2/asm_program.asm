; Garrett Johnson
; OLA 2

global main
extern printf

section .data
print_string: db `((%d * %d) - (%d / %d))/8 = %d\n`

max_index: dq 13
Array: dq 2,15,14,7,5,2,18,3,3,45,12,4,55,17,108,9   

section .text
main:
    push rbx   ; Stack alignment 
    mov r15, 0 ; Start index
    mov r14, 0 ; Continue index

loop:
    mov r14, r15            ; Move current start index into index to get subsequent numbers 
    mov rdi, Array[r15 * 8] ; Get array numbers into registers
    inc r14
    mov rsi, Array[r14 * 8]
    inc r14
    mov rdx, Array[r14 * 8]
    inc r14
    mov rcx, Array[r14 * 8]

    push rdi        ; Push arguments onto stack
    push rsi
    push rdx
    push rcx
    call compute    ; Calculate result
    pop rcx         ; Pop numbers from the stack
    pop rdx
    pop rsi
    pop rdi


    mov r9, rax     ; Put array numbers and result into printf arguments
    mov r8, rcx
    mov rcx, rdx
    mov rdx, rsi
    mov rsi, rdi
    mov rdi, print_string
    mov rax, 0

    call printf     ; Print numbers


    inc r15
    cmp r15, [max_index]  ; Compare r15 index to last viable index to prevent 
    je done               ; accessing out of bounds memory
    jmp loop

done:
    pop rbx
    ret                   ; end program

compute:
    mov r12, rdx ; Store value of rdx into r12 for use later
    mov rdx, 0   ; 0s rdx
    mov rax, rdi ; Move rsi into rax to multiply rdi
    mul rsi      ; Multiplies rdi with value of rsi
    mov rdi, rax ; Moves result of rax into rdi
    mov rax, r12 ; Move r12 into rax to divide by rcx
    mov rdx, 0   ; 0s rdx
    div rcx      ; Divides r12 with the value that was stored in rcx
    mov rsi, rax ; moves result of r12/rcx into rsi
    sub rdi, rsi ; Subtract (Array[0] * Array[1]) - (Array[3] / Array[4])
    mov rax, rdi ; Moves result of rdi - rsi into rax to divide by 8
    mov rsi, 8   ; Move 8 into  to divide result of rdi - rdx
    mov rdx, 0   ; 0s rdx
    div rsi      ; Divide rax by rsi, result stored in rax
    ret          ; Return