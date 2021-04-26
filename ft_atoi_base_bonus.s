	global _ft_atoi_base
	extern _ft_strlen
	section .text

_ft_atoi_base:
	xchg RDI, RSI
    call _ft_strlen
    xchg RDI, RSI
    cmp RAX, 2
    jb set_rax
    mov R10, RAX ; r10 = base_len
    mov RAX, -1

check_base_loop:
    inc RAX
    cmp byte[RSI + RAX], 0
    je skip_spaces_init
    cmp byte[RSI + RAX], 32 ; ' '
    je set_rax
    cmp byte[RSI + RAX], 43 ; +
    je set_rax
    cmp byte[RSI + RAX], 45 ; -
    je set_rax
    cmp byte[RSI + RAX], 12 ; \f
    je set_rax
    cmp byte[RSI + RAX], 10 ; \n
    je set_rax
    cmp byte[RSI + RAX], 13 ; \r
    je set_rax
    cmp byte[RSI + RAX], 9  ; \t
    je set_rax
    cmp byte[RSI + RAX], 11 ; \v
    je set_rax
    mov R8, RAX
    mov R9B, byte[RSI + RAX]
check_dupl_loop:
    inc R8
    cmp byte[RSI + R8], 0
    je check_base_loop
    cmp R9B, byte[RSI + R8]
    je set_rax
    jmp check_dupl_loop

set_rax:
    xor RAX, RAX
	ret

skip_spaces_init:
    mov RAX, -1
skip_spaces_loop:
    inc RAX
    cmp byte[RDI + RAX], 32 ; ' '
    je skip_spaces_loop
    cmp byte[RDI + RAX], 12 ; \f
    je skip_spaces_loop
    cmp byte[RDI + RAX], 10 ; \n
    je skip_spaces_loop
    cmp byte[RDI + RAX], 13 ; \r
    je skip_spaces_loop
    cmp byte[RDI + RAX], 9  ; \t
    je skip_spaces_loop
    cmp byte[RDI + RAX], 11 ; \v
    je skip_spaces_loop
    push R12
    mov R12, 1
    dec RAX
skip_sign_loop:
    inc RAX
    cmp byte[RDI + RAX], 45 ; -
    je set_negative
    cmp byte[RDI + RAX], 43 ; +
    je skip_sign_loop
    jmp convert_init

set_negative:
    neg R12
    jmp skip_sign_loop

convert_init:
    mov R8, RAX
    xor RAX, RAX
convert_loop:
    cmp byte [RDI + R8], 0
    je end
    mov R9B, [RDI + R8]
    xor R11, R11
find_loop:
    cmp byte [RSI + R11], 0
    je end
    cmp R9B, [RSI + R11]
    je atoi 
    inc R11
    jmp find_loop

atoi:
    mul R10
    add RAX, R11
    inc R8
    jmp convert_loop

end:
    mul R12
    pop R12
	ret
