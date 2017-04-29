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
	push	"OK"
	puts
	push	0
	ret
L501:
	call	L500, 0
	call	L500, 0
	call	L500, 0
	jmp	L999
L998:
	push	999999
	puti
L999:
