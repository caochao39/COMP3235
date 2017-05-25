	push	sp
	push	8
	add
	pop	sp
	push	90
	push	2
	push	0
	add
	pop	in
	pop	sb[in]
	push	2
	push	0
	add
	pop	in
	push	sb[in]
	puti
	push	0
	pop	sb[3]
	geti
	pop	sb[3]
	push	sb[3]
	puti
	jmp	L501
L500:
	push	sp
	push	1
	add
	pop	sp
	push	1
	pop	fp[0]
	push	80
	push	3
	push	4
	add
	pop	in
	pop	sb[in]
	push	2
	push	4
	add
	pop	in
	push	sb[in]
	puti
	push	0
	ret
L501:
	push	1
	push	2
	call	L500, 2
	jmp	L999
L998:
	push	999999
	puti
L999:
