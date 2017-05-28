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
	push	'e'
	pop	fp[0]
	push	'e'
	pop	fp[1]
	push	'e'
	pop	fp[2]
	push	'e'
	pop	fp[3]
	push	0
	push	0
	push	2
	mul
	add
	push	0
	add
	pop	in
	push	fp[in]
	putc
	push	0
	push	1
	push	2
	mul
	add
	push	0
	add
	pop	in
	push	fp[in]
	putc
	push	1
	push	0
	push	2
	mul
	add
	push	0
	add
	pop	in
	push	fp[in]
	putc
	push	1
	push	1
	push	2
	mul
	add
	push	0
	add
	pop	in
	push	fp[in]
	putc
	push	0
	ret
L501:
	call	L500, 0
	jmp	L999
L998:
	push	999999
	puti
L999:
