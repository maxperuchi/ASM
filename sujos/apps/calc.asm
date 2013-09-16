calc:
	mov si, [calc_texto1]
	call imprimir_nl
	call ler_char
	mov si, [calc_texto2]
	call imprimir_nl
	call ler_char
	mov si, [calc_texto3]
	call imprimir_nl
	

	call ler_char

	ret

data:
	cmd db 'calc',0
	calc_texto1 db 'Entre com o valor A: ',0
	calc_texto2 db 'Entre com o valor B: ',0
	calc_texto3 db 'Resultado de A+B: ',0