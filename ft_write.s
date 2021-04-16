			global _ft_write
			extern ___error
			section .text
_ft_write:
			mov		rax, 0x2000004	; function write
			syscall					; tell system to execute it with args already on registries
			jc		error
			ret						; return the returned value from the function
error:
			push	rax
			call	___error
			pop		qword [rax]
			mov		rax, -1
			ret

