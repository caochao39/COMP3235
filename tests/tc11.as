	push	sp
	push	1
	add
	pop	sp
	jmp	L501
L500:
	push	sp
	push	0
	add
	pop	sp
	push	10
	pop	sb[0]
	push	0
	ret
L501:
	jmp	L503
L502:
	push	sp
	push	0
	add
	pop	sp
	push	sb[0]
	puti
	push	0
	ret
L503:
	call	L500, 0
	call	L502, 0
	jmp	L999
L998:
	push	999999
	puti
L999:
