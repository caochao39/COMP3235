	push	sp
	push	2
	add
	pop	sp
	push	10
	pop	sb[0]
	jmp	L501
L500:
	push	sp
	push	1
	add
	pop	sp
	push	1
	pop	sb[0]
	push	2
	pop	fp[0]
	push	sb[0]
	push	fp[-4]
	add
	push	fp[0]
	add
	ret
	jmp	L501
L501:
	push	sb[0]
	call	L500, 1
	puti
	jmp	L999
L998:
	push	999999
	puti
L999:
