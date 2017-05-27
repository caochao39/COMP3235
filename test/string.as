	push	sp
	push	4
	add
	pop	sp
	push	1
	push	0
	push	0
	add
	pop	in
	pop	sb[in]
	push	2
	push	1
	push	0
	add
	pop	in
	pop	sb[in]
	push	3
	push	2
	push	0
	add
	pop	in
	pop	sb[in]
	push	2
	pop	sb[3]
	push	sb[3]
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
