			global _ft_strlen
			section .text
_ft_strlen:
			xor	rax, rax			; i = 0
			jmp	count				; jump to count
count:
			cmp	BYTE [rdi + rax], 0 ; checking if str[i] == 0
			je	done				; if true, jump to done
			inc rax					; rax++
			jmp count				; recursive call
done:
			ret						; return rax value