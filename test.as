	push	sp
	push	3
	add
	pop	sp
	push	1
	push	2
	add
	pop	sb[0]
	push	3
	pop	sb[1]
	geti
	pop	sb[2]
	push	sb[2]
	puti
	jmp	L999
L998:
	push	999999
	puti
L999:
