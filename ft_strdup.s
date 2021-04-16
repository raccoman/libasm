			global _ft_strdup
			extern	_malloc
			extern	_ft_strlen
			extern	_ft_strcpy
			section .text
_ft_strdup:
			call	_ft_strlen			; rax = strlen(s1)
			push	rax					; save length
			jmp		malloc				; allocate enough mem
			cmp		rax, 0				; malloc protection
			je		done				; if NULL, return rax = 0
			call	_ft_strcpy			; rax = strcpy(s1)
			mov		rdi, rax			; string --> rdi
			pop		rax					; restore length
			mov		BYTE [rdi + rax], 0 ; null terminate string
			mov		rax, rdi			; string --> rax
			jmp		 done				; return rax
malloc:
			push	rdi					; save s1
			inc		rax					; rax + 1, for null terminating
			mov		rdi, rax			; length -> rdi
			call	_malloc				; rax = malloc(length)
			pop		rdi					; restore s1
done:
			ret							; return rax