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
	ret
L501:
	call	L500, 0
	j0	L000
	push	"OK"
	puts
L000:
	jmp	L999
L998:
	push	999999
	puti
L999:
