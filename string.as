	push	sp
	push	10
	add
	pop	sp
	push	'h'
	push	0
	push	0
	add
	pop	in
	pop	sb[in]
	push	'e'
	push	1
	push	0
	add
	pop	in
	pop	sb[in]
	push	'l'
	push	2
	push	0
	add
	pop	in
	pop	sb[in]
	push	'l'
	push	3
	push	0
	add
	pop	in
	pop	sb[in]
	push	'o'
	push	4
	push	0
	add
	pop	in
	pop	sb[in]
	push	2
	push	0
	add
	pop	in
	push	sb[in]
	putc
	push	'e'
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
	putc
	jmp	L999
L998:
	push	999999
	puti
L999:
