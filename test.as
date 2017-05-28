	push	sp
	push	5
	add
	pop	sp
	jmp	L501
L500:
	push	sp
	push	0
	add
	pop	sp
	push	'c'
	pop	sb[0]
	push	'c'
	pop	sb[1]
	push	'c'
	pop	sb[2]
	push	'c'
	pop	sb[3]
	push	'c'
	pop	sb[4]
	push	0
	ret
L501:
	call	L500, 0
	push	0
	push	0
	add
	pop	in
	push	sb[in]
	putc
	push	1
	push	0
	add
	pop	in
	push	sb[in]
	putc
	push	2
	push	0
	add
	pop	in
	push	sb[in]
	putc
	push	3
	push	0
	add
	pop	in
	push	sb[in]
	putc
	push	4
	push	0
	add
	pop	in
	push	sb[in]
	putc
	jmp	L999
L998:
	push	999999
	puti
L999:
