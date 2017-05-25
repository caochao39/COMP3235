	push	sp
	push	3
	add
	pop	sp
	push	3
	pop	sb[0]
	jmp	L501
L500:
	push	sp
	push	0
	add
	pop	sp
	push	2
	pop	sb[1]
	push	sb[0]
	push	sb[1]
	add
	push	fp[-6]
	add
	pop	fp[-7]
	push	fp[-7]
	ret
L501:
	push	1
	push	2
	push	3
	push	4
	call	L500, 4
	pop	sb[2]
	push	sb[2]
	puti
	jmp	L999
L998:
	push	999999
	puti
L999:
