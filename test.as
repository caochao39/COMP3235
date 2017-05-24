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
	push	fp[-6]
	push	0
	push	fp[-7]
	add
	pop	in
	push	in
	push	fp[-2]
	add
	pop	in
	pop	sb[in]
	push	fp[-5]
	push	1
	push	fp[-7]
	add
	pop	in
	push	in
	push	fp[-2]
	add
	pop	in
	pop	sb[in]
	push	fp[-4]
	push	2
	push	fp[-7]
	add
	pop	in
	push	in
	push	fp[-2]
	add
	pop	in
	pop	sb[in]
	push	0
	ret
L501:
	jmp	L503
L502:
	push	sp
	push	0
	add
	pop	sp
	push	0
	push	fp[-4]
	add
	pop	in
	push	in
	push	fp[-2]
	add
	pop	in
	push	sb[in]
	push	1
	push	fp[-4]
	add
	pop	in
	push	in
	push	fp[-2]
	add
	pop	in
	push	sb[in]
	add
	push	2
	push	fp[-4]
	add
	pop	in
	push	in
	push	fp[-2]
	add
	pop	in
	push	sb[in]
	add
	ret
L503:
	jmp	L505
L504:
	push	sp
	push	0
	add
	pop	sp
	push	0
	push	fp[-4]
	add
	pop	in
	push	in
	push	fp[-2]
	add
	pop	in
	push	sb[in]
	puti
	push	1
	push	fp[-4]
	add
	pop	in
	push	in
	push	fp[-2]
	add
	pop	in
	push	sb[in]
	puti
	push	2
	push	fp[-4]
	add
	pop	in
	push	in
	push	fp[-2]
	add
	pop	in
	push	sb[in]
	puti
	push	0
	ret
L505:
	push	0
	push	2
	push	4
	push	6
	call	L500, 4
	push	0
	call	L504, 1
	push	0
	call	L502, 1
	puti
	jmp	L999
L998:
	push	999999
	puti
L999:
