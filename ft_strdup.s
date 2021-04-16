			global _ft_strdup
			extern	_malloc
			extern	_ft_strlen
			extern	_ft_strcpy
			section .text
_ft_strdup:
			call	_ft_strlen			; rax = strlen(s1)

			push	rdi					; save s1
			inc		rax					; rax + 1, for null terminating
			mov		rdi, rax			; length -> rdi
			call	_malloc				; rax = malloc(length)
			pop		rsi					; restore s1

			cmp		rax, 0				; malloc protection
			je		done				; if NULL, return rax = 0

			mov		rdi, rax
			call	_ft_strcpy			; rax = strcpy(s1)
done:
			ret							; return rax