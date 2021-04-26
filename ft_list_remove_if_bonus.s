	global _ft_list_remove_if
	extern _free
	section .text

_ft_list_remove_if:
    push R12
    push R13
    push R14
    push R15
    xor R14, R14
    mov R13, [RDI]
    mov R15, RCX
while:
    cmp R13, 0
    je end
    push RDI
    push RSI
    push RDX
    mov RDI, [R13]
    call RDX ; call cmp
    pop RDX
    pop RSI
    pop RDI
    cmp EAX, 0
    jne no_remove
    mov R12, [R13 + 8]
    push RDI
    push RSI
    push RDX
    mov RDI, [R13]
    call R15 ; call ft_free
    mov RDI, R13
    call _free
    pop RDX
    pop RSI
    pop RDI
    cmp R14, 0
    je is_begin
    mov [R14 + 8], R12

inc:
    mov R13, R12
    jmp while

is_begin:
    mov [RDI], R12
    jmp inc 

no_remove:
    mov R14, R13
    mov R13, [R13 + 8]
    jmp while

end:
    pop R15
    pop R14
    pop R13
    pop R12
    ; mov RAX, 77
    ret