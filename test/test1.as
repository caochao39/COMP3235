	push	sp
	push	6
	add
	pop	sp
	push	123
	pop	sb[0]
	push	'x'
	pop	sb[1]
	push	"TEST"
	pop	sb[2]
	geti
	pop	sb[3]
	getc
	pop	sb[4]
	gets
	pop	sb[5]
	push	sb[0]
	puti_
	push	sb[3]
	puti
	push	sb[1]
	putc_
	push	sb[4]
	putc
	push	sb[2]
	puts_
	push	sb[5]
	puts
	jmp	L999
L998:
	push	999999
	puti
L999:
