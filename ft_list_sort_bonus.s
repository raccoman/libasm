	global _ft_list_sort
	extern _ft_list_size
	section .text

_ft_list_sort:
    push R12
    push R13
    push R14
    push R15
    cmp RDI, 0
    je end
    push RDI
    mov RDI, [RDI]
    call _ft_list_size
    pop RDI
    cmp RAX, 2
    jb end
    mov R12, RAX
    jmp rec_sort
end:
    pop R15
    pop R14
    pop R13
    pop R12
    ret

rec_sort:
    xor R13, R13 ; i = 0
    xor R14, R14  ; unordered = 0
    mov R15, qword [RDI] ; tmp = *begin_list
    dec R12 ; len--
while:
    cmp R13, R12 ; while (i < len - 1)
    jae end_sort
    push RDI
    push RSI
    mov RAX, RSI  ; RAX = cmp
    mov RDI, [R15]; RDI = tmp->data
    mov R11, [R15 + 8]  ; R11 = tmp->next
    mov RSI, [R11] ; RSI = next->data
    call RAX ; cmp(tmp->data, next->data)
    pop RSI
    pop RDI
    cmp EAX, 0
    jle inc_while
    mov R14, 1 ; unordered = 1
    mov RDX, [R15] ; tmp_data = tmp->data
    mov R11, [R15 + 8] ; R11 = next
    mov R8, [R11] ; R8 = next->data
    mov [R15], R8 ; tmp->data = next->data
    mov [R11], RDX ; next->data = tmp->data

inc_while:
    inc R13 ; i++
    mov R15, [R15 + 8] ; tmp = tmp->next
    jmp while

end_sort:
    cmp R14, 0
    je end
    cmp R12, 2
    jb end
    jmp rec_sort