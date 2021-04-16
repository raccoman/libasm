			global _ft_strcmp
			section .text
_ft_strcmp:
			xor	rax, rax							; i = 0
			jmp	iterator							; jump to iterator
iterator:
			cmp	BYTE [rdi + rax], 0 				; checking if s1[i] == 0
			je	done								; if true, jump to done
			cmp	BYTE [rsi + rax], 0					; checking if s2[i] == 0
			je	done								; if true, jump to done
			cmp BYTE [rdi + rax], BYTE [rsi + rax]	; checking if s1[i] != s2[i]
			jne done								; if true, jump to done
			inc rax									; rax++
			call iterator							; recursive call
done:
			mov dl, BYTE [rdi + rax]				; move s1[i] in a 8-bit registry
			sub dl, BYTE [rsi + rax]				; substitute s2[i]
			mov rax, dl								; move result to rax
			ret										; return rax