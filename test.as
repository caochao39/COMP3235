	push	sp
	push	4
	add
	pop	sp
	push	1111
	push	0
	push	0
	push	2
	mul
	add
	push	0
	add
	pop	in
	pop	sb[in]
	push	2222
	push	1
	push	0
	push	2
	mul
	add
	push	0
	add
	pop	in
	pop	sb[in]
	push	3333
	push	0
	push	1
	push	2
	mul
	add
	push	0
	add
	pop	in
	pop	sb[in]
	push	4444
	push	1
	push	1
	push	2
	mul
	add
	push	0
	add
	pop	in
	pop	sb[in]
	jmp	L501
L500:
	push	sp
	push	0
	add
	pop	sp
	push	-7
	push	7
	push	fp[-3]
	add
	add
	call	L502, 4
	push	0
	ret
L501:
	jmp	L503
L502:
	push	sp
	push	0
	add
	pop	sp
	push	1
	push	0
	push	2
	mul
	add
	push	fp[-7]
	add
	pop	in
	push	sb[in]
	puts
	push	0
	ret
L503:
	push	0
	call	L500, 4
	jmp	L999
L998:
	push	999999
	puti
L999:
