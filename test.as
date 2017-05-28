	push	sp
	push	4
	add
	pop	sp
	push	555
	pop	sb[0]
	push	555
	pop	sb[1]
	push	555
	pop	sb[2]
	push	555
	pop	sb[3]
	jmp	L999
L998:
	push	999999
	puti
L999:
