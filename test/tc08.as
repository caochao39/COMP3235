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
	push	fp[-4]
	puti
	push	0
	ret
L501:
	push	999
	pop	sb[0]
	push	sb[0]
	call	L500, 1
	jmp	L999
L998:
	push	999999
	puti
L999:
