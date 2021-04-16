			global _ft_write
			section .text
_ft_write:
			mov		rax, 0x2000004	; function write
			syscall					; tell system to execute it with args already on registries
			ret						; return the returned value from the function