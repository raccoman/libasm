	global _ft_list_size
	section .text

_ft_list_size:
	xor RAX, RAX
	push RDI
count_loop:
	cmp RDI, 0
	je end
	inc RAX
	mov RDI, [RDI + 8]
	jmp count_loop

end:
	pop RDI
	ret


