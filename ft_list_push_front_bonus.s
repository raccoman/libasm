	global _ft_list_push_front
	extern _malloc
	section .text

_ft_list_push_front:
	push RDI
	push RSI
	mov RDI, 16
	sub RSP, 8
	call _malloc
	add RSP, 8
	pop RSI
	pop RDI
	mov [RAX], RSI
	mov R8, [RDI]
	mov [RAX + 8], R8
	mov [RDI], RAX
	ret
	
