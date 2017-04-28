	push	sp
	push	2
	add
	pop	sp
	geti
	pop	sb[0]
	push	sb[0]
	push	0
	compEQ
	j0	L000
	push	1
	puti
	jmp	L001
L000:
	push	sb[0]
	push	1
	compGE
	push	sb[0]
	push	12
	compLE
	and
	j0	L002
	push	1
	pop	sb[1]
L003:
	push	sb[0]
	push	1
	compGT
	j0	L004
	push	sb[1]
	push	sb[0]
	mul
	pop	sb[1]
	push	sb[0]
	push	1
	sub
	pop	sb[0]
	jmp	L003
L004:
	push	sb[1]
	puti
L002:
L001:
	jmp	L999
L998:
	push	999999
	puti
L999:
