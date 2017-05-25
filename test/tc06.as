	push	sp
	push	3
	add
	pop	sp
	push	1
	pop	sb[0]
	push	1
	pop	sb[1]
L000:
	push	sb[1]
	push	100
	compLT
	j0	L001
	push	sb[1]
	pop	sb[2]
L003:
	push	sb[2]
	push	0
	compGT
	j0	L004
	push	sb[2]
	push	2
	div
	pop	sb[2]
	push	sb[2]
	push	1
	compEQ
	j0	L005
	jmp	L004
L005:
	jmp	L003
L004:
	push	sb[1]
	push	10
	compLT
	j0	L006
	jmp	L002
L006:
	push	sb[0]
	push	1
	add
	pop	sb[0]
L002:
	push	sb[1]
	push	sb[0]
	add
	pop	sb[1]
	jmp	L000
L001:
	push	sb[1]
	puti_
	push	", "
	puts_
	push	sb[2]
	puti_
	push	", "
	puts_
	push	sb[0]
	puti
	jmp	L999
L998:
	push	999999
	puti
L999:
