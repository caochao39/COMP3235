	push	sp
	push	1
	add
	pop	sp
	jmp	L501
L500:
	push	sp
	push	1
	add
	pop	sp
	push	fp[-4]
	push	1
	compLE
	j0	L000
	push	0
	ret
L000:
	push	fp[-4]
	push	2
	compEQ
	j0	L001
	push	1
	ret
L001:
	push	2
	pop	fp[0]
L002:
	push	fp[0]
	push	fp[-4]
	compLT
	j0	L003
	push	fp[-4]
	push	fp[0]
	div
	push	fp[0]
	mul
	push	fp[-4]
	compEQ
	j0	L005
	push	0
	ret
L005:
L004:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L002
L003:
	push	1
	ret
L501:
	geti
	pop	sb[0]
	push	sb[0]
	puti_
	push	sb[0]
	call	L500, 1
	j0	L006
	push	" is a prime"
	puts
	jmp	L007
L006:
	push	" is not a prime"
	puts
L007:
	jmp	L999
L998:
	push	999999
	puti
L999:
