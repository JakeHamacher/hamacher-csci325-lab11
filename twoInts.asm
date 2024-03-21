section .text
    global _start
_start:

    ; Print message 1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, msg1_len
    int 0x80

    ; Delay loop
    mov ecx, 1000  ; Adjust this value to control delay (higher = longer)
loop:
        dec ecx
        jnz loop      ; Jump back if not zero (repeat loop)

    ; Read first integer
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 5
    int 0x80

    ; Print message 2
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, msg2_len
    int 0x80

    ; Read second integer
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 5
    int 0x80

    ; Print message 3
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; Calculate sum
    mov eax, [num1]
    sub eax, '0'
    mov ebx, [num2]
    sub ebx, '0'
    add eax, ebx
    add eax, '0'
    mov [res], eax

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, res
    mov edx, 5
    int 0x80

exit:
    mov eax, 1
    int 0x80

section .data
    msg1 db "Enter The First Integer: "
    msg1_len equ $ - msg1

    msg2 db "Enter The Second Integer: "
    msg2_len equ $ - msg2

    msg db "The Sum Is: "
    msg_len equ $ - msg

section .bss
    num1 resb 5
    num2 resb 5
    res resb 5
