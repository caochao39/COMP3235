	push	sp
	push	3
	add
	pop	sp
	getc
	pop	sb[0]
	push	sb[0]
	pop	sb[1]
	push	'X'
	pop	sb[2]
	push	sb[1]
	putc_
	push	sb[2]
	putc
	jmp	L999
L998:
	push	999999
	puti
L999:
