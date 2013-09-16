kernel:
	call ler_comando
	cld 
	lea si, [comando]
	lea di, [calculadora]
	mov cx, 5
	repe cmpsb
	je .desenhar

	jmp $

.desenhar:
	mov ax, 13h
	int 10h
	call desenho1
	ret

	comando times 255 db 0
	calculadora db 'calc',0

%INCLUDE 'graph\desenho1.asm'
%INCLUDE 'api\io.asm'
