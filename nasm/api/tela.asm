tela_vermelha:
	;Coloca a tela VERMELHA
	mov ah, 0Bh
	mov bl, 4
	int 10h
	ret	

tela_azul:
	;Coloca a tela AZUL
	mov ah, 0Bh
	mov bl, 1
	int 10h
	ret
	
modo_vga:
	mov AH,0h
	mov AL,13h
	int 10h
	ret

modo_texto:
	mov AH,0h
	mov AL, 03h
	int 10h
	ret