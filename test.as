	push	sp
	push	3
	add
	pop	sp
	jmp	L501
L500:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	fp[-5]
	push	fp[-6]
	add
	pop	in
	pop	sb[in]
	push	0
	ret
L501:
	push	0
	push	1
	push	2
	call	L500, 3
	push	1
	push	0
	add
	pop	in
	push	sb[in]
	puti
	jmp	L999
L998:
	push	999999
	puti
L999:
