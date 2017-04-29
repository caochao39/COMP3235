	push	sp
	push	3
	add
	pop	sp
	gets
	pop	sb[0]
	push	sb[0]
	pop	sb[1]
	push	"test!"
	pop	sb[2]
	push	sb[1]
	puts_
	push	sb[2]
	puts
	jmp	L999
L998:
	push	999999
	puti
L999:
