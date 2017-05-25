	push	sp
	push	3
	add
	pop	sp
	jmp	L501
L500:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-7]
	push	fp[-6]
	add
	push	fp[-5]
	push	fp[-4]
	add
	mul
	ret
L501:
	push	10
	pop	sb[0]
	push	15
	pop	sb[1]
	push	40
	pop	sb[2]
	push	sb[0]
	push	sb[2]
	push	sb[2]
	push	sb[1]
	call	L500, 4
	pop	sb[2]
	push	sb[2]
	puti
	jmp	L999
L998:
	push	999999
	puti
L999:
