			global _ft_strcmp
			section .text
_ft_strcmp:
			xor		rax, rax							; i = 0
			jmp		iterator							; jump to iterator
iterator:
			cmp		BYTE [rdi + rax], 0 				; checking if s1[i] == 0
			je		done								; if true, jump to done
			cmp		BYTE [rsi + rax], 0					; checking if s2[i] == 0
			je		done								; if true, jump to done
			mov 	dl, BYTE [rsi + rax]
			cmp 	BYTE [rdi + rax], dl				; checking if s1[i] != s2[i]
			jne 	done								; if true, jump to done
			inc 	rax									; rax++
			jmp 	iterator							; recursive call
done:
			xor		rcx, rcx
			xor		rdx, rdx
			movzx	rcx, BYTE [rdi + rax]				; move s1[i] in a 8-bit registry
			movzx	rdx, BYTE [rsi + rax]				; move s2[i] in a 8-bit registry
			sub		rcx, rdx
			mov		rax, rcx							; move result to rax
			ret											; return rax