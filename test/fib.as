	push	sp
	push	1
	add
	pop	sp
	jmp	L501
L500:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	0
	compEQ
	push	fp[-4]
	push	1
	compEQ
	or
	j0	L000
	push	1
	ret
L000:
	push	fp[-4]
	push	1
	sub
	call	L500, 1
	push	fp[-4]
	push	2
	sub
	call	L500, 1
	add
	ret
L501:
	push	"Fibonacci - Please input a number: "
	puts
	geti
	pop	sb[0]
	push	sb[0]
	call	L500, 1
	puti
	jmp	L999
L998:
	push	999999
	puti
L999:
