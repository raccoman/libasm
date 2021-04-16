			global _ft_read
			extern ___error
			section .text
_ft_read:
			mov		rax, 0x2000003	; function read
			syscall					; tell system to execute it with args already on registries
			jc		error
			ret						; return the returned value from the function
error:
			push	rax
			call	___error
			pop		qword [rax]
			mov		rax, -1
			ret