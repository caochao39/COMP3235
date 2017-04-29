	push	sp
	push	0
	add
	pop	sp
	jmp	L501
L500:
	push	sp
	push	0
	add
	pop	sp
	push	1
	puti
	push	0
	ret
L501:
	jmp	L503
L502:
	push	sp
	push	0
	add
	pop	sp
	push	5
	puti
	push	0
	ret
L503:
	jmp	L505
L504:
	push	sp
	push	0
	add
	pop	sp
	push	12
	puti
	push	0
	ret
L505:
	call	L500, 0
	call	L502, 0
	call	L504, 0
	jmp	L999
L998:
	push	999999
	puti
L999:
