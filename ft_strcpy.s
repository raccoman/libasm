			global _ft_strcpy
			section .text
_ft_strcpy:
			xor	rax, rax				; i = 0
			jmp	iterator				; jump to iterator
iterator:
			cmp	BYTE [rsi + rax], 0 	; checking if src[i] == 0
			je	done					; if true, jump to done
			mov	dl, BYTE [rsi + rax]	; move src[i] in a 8-bit registry
			mov	BYTE [rdi + rax], dl	; move the byte in the registry to dst[i]
			inc	rax						; rax++
			jmp	iterator				; recursive call

done:
			mov	BYTE [rdi + rax], 0		; null terminate dst
			mov	rax, rdi				; move dst to rax
			ret							; return rax value