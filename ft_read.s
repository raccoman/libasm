			global _ft_read
			section .text
_ft_read:
			mov		rax, 0x2000003	; function read
			syscall					; tell system to execute it with args already on registries
			ret						; return the returned value from the function