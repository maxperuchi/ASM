imprimir:
	mov ah, 0Eh

	.escreve:
		lodsb
		cmp al,0
		je .fim
		int 10h
		jmp .escreve

	.fim:
		ret

imprimir_nl:
	mov ah, 0Eh

	.escreve:
		lodsb
		cmp al,0
		je .fim
		int 10h
		jmp .escreve

	.fim:
		mov al, 0xA
		int 10h
		mov al, 0xD
		int 10h
		ret

			
ler_char:
	.ler:
		mov ah, 00h
		int 16h
		mov ah, 0Eh
		int 10h
		mov dl, al
		jmp .fim
			
	.fim:
		ret

ler_comando:	
	mov bx, 00 ;zerando o contador
	lea si, [comando] ;cria o ponteiro de si para a variavel comando
	.ler:
		call ler_char
		cmp al, 13 ;se for enter,  termina a rotina
		je .fim
		mov  [si+bx], al ;joga o char para a proxima posicao de si(que eh um ponteiro para a variavel comando)
		inc bx
		jmp .ler
	
	.fim:
		mov byte [si+bx], 00 ;adiciona um char NULL para finalizar a string
		mov al, 0xA
		int 10h
		mov al, 0xD
		int 10h
		ret


prompt:
	mov ah, 0Eh
	mov al, 's'
	int 10h
	mov al, 'u'
	int 10h
	mov al, 'j'
	int 10h
	mov al, 'O'
	int 10h
	mov al, 'S'
	int 10h
	mov al, '>'
	int 10h

	ret
	