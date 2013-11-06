kernel:
	mov cx, 3

	call ler_comando
	lea si, [comando]
	lea di, [max]
	repe cmpsb
	je .desenhar_max
	
	lea si, [comando]
	lea di, [bem]
	repe cmpsb
	je .desenhar_boas_vindas	

	jmp kernel


.desenhar_max:
	mov ax, 13h
	int 10h
	call d_max
	ret

.desenhar_boas_vindas:
	mov ax, 13h
	int 10h
	call boasvindas
	ret

	comando times 255 db 0
	max db 'max',0
	bem db 'bem',0

%INCLUDE 'graph/max.asm'
%INCLUDE 'graph/boasvindas.asm'
%INCLUDE 'api/io.asm'
