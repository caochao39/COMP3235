	push	sp
	push	0
	add
	pop	sp
	jmp	L501
L500:
	push	sp
	push	4
	add
	pop	sp
	push	fp[-6]
	push	0
	push	0
	add
	pop	in
	pop	fp[in]
	push	fp[-5]
	push	1
	push	0
	add
	pop	in
	pop	fp[in]
	push	0
	push	6
	push	fp[-3]
	add
	add
	push	fp[-4]
	call	L502, 2
	push	0
	ret
L501:
	jmp	L503
L502:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	2
	push	fp[-5]
	add
	pop	in
	pop	sb[in]
	push	0
	push	fp[-5]
	add
	pop	in
	push	sb[in]
	puti
	push	1
	push	fp[-5]
	add
	pop	in
	push	sb[in]
	puti
	push	2
	push	fp[-5]
	add
	pop	in
	push	sb[in]
	puti
	push	0
	ret
L503:
	push	1
	push	2
	push	3
	call	L500, 3
	jmp	L999
L998:
	push	999999
	puti
L999:
