	push	sp
	push	7
	add
	pop	sp
	push	0
	pop	sb[0]
L000:
	push	sb[0]
	push	6
	compLT
	j0	L001
	push	12
	pop	sb[1]
L003:
	push	sb[1]
	push	6
	compGT
	j0	L004
	push	0
	pop	sb[2]
L006:
	push	sb[2]
	push	6
	compLT
	j0	L007
	push	12
	pop	sb[3]
L009:
	push	sb[3]
	push	6
	compGT
	j0	L010
	push	0
	pop	sb[4]
L012:
	push	sb[4]
	push	4
	compLT
	j0	L013
	push	0
	pop	sb[5]
L015:
	push	sb[5]
	push	4
	compLT
	j0	L016
	push	0
	pop	sb[6]
L018:
	push	sb[6]
	push	4
	compLT
	j0	L019
	push	sb[0]
	puti_
	push	sb[1]
	puti_
	push	sb[2]
	puti_
	push	sb[3]
	puti_
	push	sb[4]
	puti_
	push	sb[5]
	puti_
	push	sb[6]
	puti
L020:
	push	sb[6]
	push	1
	add
	pop	sb[6]
	jmp	L018
L019:
L017:
	push	sb[5]
	push	1
	add
	pop	sb[5]
	jmp	L015
L016:
L014:
	push	sb[4]
	push	1
	add
	pop	sb[4]
	jmp	L012
L013:
L011:
	push	sb[3]
	push	1
	sub
	pop	sb[3]
	jmp	L009
L010:
L008:
	push	sb[2]
	push	1
	add
	pop	sb[2]
	jmp	L006
L007:
L005:
	push	sb[1]
	push	1
	sub
	pop	sb[1]
	jmp	L003
L004:
L002:
	push	sb[0]
	push	1
	add
	pop	sb[0]
	jmp	L000
L001:
	jmp	L999
L998:
	push	999999
	puti
L999:
