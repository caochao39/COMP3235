	push	sp
	push	3
	add
	pop	sp
	push	100
	pop	sb[0]
	push	100
	pop	sb[1]
	push	200
	pop	sb[2]
	push	sb[2]
	push	sb[0]
	compLT
	j0	L000
	push	"c<a"
	puts
L000:
	jmp	L999
L998:
	push	999999
	puti
L999:
