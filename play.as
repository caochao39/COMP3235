	push	sp
	push	13
	add
	pop	sp
	jmp	L501
L500:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	'A'
	compEQ
	j0	L000
	push	1
	ret
L000:
	push	fp[-4]
	push	'2'
	compEQ
	j0	L001
	push	2
	ret
L001:
	push	fp[-4]
	push	'3'
	compEQ
	j0	L002
	push	3
	ret
L002:
	push	fp[-4]
	push	'4'
	compEQ
	j0	L003
	push	4
	ret
L003:
	push	fp[-4]
	push	'5'
	compEQ
	j0	L004
	push	5
	ret
L004:
	push	fp[-4]
	push	'6'
	compEQ
	j0	L005
	push	6
	ret
L005:
	push	fp[-4]
	push	'7'
	compEQ
	j0	L006
	push	7
	ret
L006:
	push	fp[-4]
	push	'8'
	compEQ
	j0	L007
	push	8
	ret
L007:
	push	fp[-4]
	push	'9'
	compEQ
	j0	L008
	push	9
	ret
L008:
	push	fp[-4]
	push	'0'
	compEQ
	j0	L009
	push	10
	ret
L009:
	push	fp[-4]
	push	'J'
	compEQ
	j0	L010
	push	11
	ret
L010:
	push	fp[-4]
	push	'Q'
	compEQ
	j0	L011
	push	12
	ret
L011:
	push	fp[-4]
	push	'K'
	compEQ
	j0	L012
	push	13
	ret
L012:
L501:
	jmp	L503
L502:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	'('
	compEQ
	push	fp[-4]
	push	')'
	compEQ
	or
	j0	L013
	push	0
	ret
L013:
	push	fp[-4]
	push	'+'
	compEQ
	push	fp[-4]
	push	'-'
	compEQ
	or
	j0	L014
	push	1
	ret
L014:
	push	fp[-4]
	push	'*'
	compEQ
	push	fp[-4]
	push	'/'
	compEQ
	or
	j0	L015
	push	2
	ret
L015:
L503:
	jmp	L505
L504:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	'+'
	compEQ
	j0	L016
	push	fp[-5]
	push	fp[-6]
	add
	ret
	jmp	L017
L016:
	push	fp[-4]
	push	'-'
	compEQ
	j0	L018
	push	fp[-5]
	push	fp[-6]
	sub
	ret
	jmp	L019
L018:
	push	fp[-4]
	push	'*'
	compEQ
	j0	L020
	push	fp[-5]
	push	fp[-6]
	mul
	ret
	jmp	L021
L020:
	push	fp[-4]
	push	'/'
	compEQ
	j0	L022
	push	fp[-5]
	push	fp[-6]
	div
	ret
	jmp	L023
L022:
	push	99999
	neg
	ret
L023:
L021:
L019:
L017:
L505:
	jmp	L507
L506:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	fp[-5]
	push	fp[-6]
	add
	pop	in
	pop	sb[in]
	push	fp[-5]
	push	1
	add
	pop	fp[-5]
	push	fp[-5]
	ret
L507:
	jmp	L509
L508:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	1
	sub
	pop	fp[-4]
	push	99999
	neg
	push	fp[-4]
	push	fp[-5]
	add
	pop	in
	pop	sb[in]
	push	fp[-4]
	ret
L509:
	jmp	L511
L510:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	1
	sub
	push	fp[-5]
	add
	pop	in
	push	sb[in]
	ret
L511:
	jmp	L513
L512:
	push	sp
	push	108
	add
	pop	sp
	push	0
	pop	fp[100]
	push	0
	pop	fp[101]
	push	0
	pop	fp[102]
L024:
	push	fp[102]
	push	fp[-4]
	add
	pop	in
	push	sb[in]
	push	'e'
	compNE
	j0	L025
	push	fp[102]
	push	fp[-4]
	add
	pop	in
	push	sb[in]
	pop	fp[103]
	push	"[DEBUG] input char: "
	puts_
	push	fp[103]
	putc
	push	fp[103]
	push	'A'
	compEQ
	push	fp[103]
	push	'2'
	compEQ
	or
	push	fp[103]
	push	'3'
	compEQ
	or
	push	fp[103]
	push	'4'
	compEQ
	or
	push	fp[103]
	push	'5'
	compEQ
	or
	push	fp[103]
	push	'6'
	compEQ
	or
	push	fp[103]
	push	'7'
	compEQ
	or
	push	fp[103]
	push	'8'
	compEQ
	or
	push	fp[103]
	push	'9'
	compEQ
	or
	push	fp[103]
	push	'0'
	compEQ
	or
	push	fp[103]
	push	'J'
	compEQ
	or
	push	fp[103]
	push	'Q'
	compEQ
	or
	push	fp[103]
	push	'K'
	compEQ
	or
	j0	L026
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	push	fp[103]
	call	L500, 1
	call	L506, 3
	pop	fp[101]
L026:
	push	fp[103]
	push	'('
	compEQ
	j0	L027
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L506, 3
	pop	fp[100]
L027:
	push	fp[103]
	push	'+'
	compEQ
	push	fp[103]
	push	'-'
	compEQ
	or
	push	fp[103]
	push	'*'
	compEQ
	or
	push	fp[103]
	push	'/'
	compEQ
	or
	j0	L028
	push	fp[100]
	push	0
	compEQ
	j0	L029
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L506, 3
	pop	fp[100]
	jmp	L030
L029:
	push	fp[103]
	call	L502, 1
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
	call	L502, 1
	compGT
	j0	L031
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L506, 3
	pop	fp[100]
	jmp	L032
L031:
L033:
	push	fp[100]
	push	0
	compGT
	push	fp[103]
	call	L502, 1
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
	call	L502, 1
	compLE
	and
	j0	L034
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[104]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L508, 2
	pop	fp[101]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[105]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L508, 2
	pop	fp[101]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
	pop	fp[106]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L508, 2
	pop	fp[100]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	push	fp[104]
	push	fp[105]
	push	fp[106]
	call	L504, 3
	call	L506, 3
	pop	fp[101]
	jmp	L033
L034:
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L506, 3
	pop	fp[100]
L032:
L030:
L028:
	push	fp[103]
	push	')'
	compEQ
	j0	L035
L036:
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
	push	'('
	compNE
	j0	L037
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[104]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L508, 2
	pop	fp[101]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[105]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L508, 2
	pop	fp[101]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
	pop	fp[106]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L508, 2
	pop	fp[100]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	push	fp[104]
	push	fp[105]
	push	fp[106]
	call	L504, 3
	call	L506, 3
	pop	fp[101]
	jmp	L036
L037:
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L508, 2
	pop	fp[100]
L035:
	push	fp[102]
	push	1
	add
	pop	fp[102]
	jmp	L024
L025:
L038:
	push	fp[100]
	push	0
	compGT
	j0	L039
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[104]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L508, 2
	pop	fp[101]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[105]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L508, 2
	pop	fp[101]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
	pop	fp[106]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L508, 2
	pop	fp[100]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	push	fp[104]
	push	fp[105]
	push	fp[106]
	call	L504, 3
	call	L506, 3
	pop	fp[101]
	jmp	L038
L039:
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[107]
	push	fp[107]
	ret
L513:
	push	'('
	push	0
	push	0
	add
	pop	in
	pop	sb[in]
	push	'('
	push	1
	push	0
	add
	pop	in
	pop	sb[in]
	push	'6'
	push	2
	push	0
	add
	pop	in
	pop	sb[in]
	push	'-'
	push	3
	push	0
	add
	pop	in
	pop	sb[in]
	push	'2'
	push	4
	push	0
	add
	pop	in
	pop	sb[in]
	push	')'
	push	5
	push	0
	add
	pop	in
	pop	sb[in]
	push	'+'
	push	6
	push	0
	add
	pop	in
	pop	sb[in]
	push	'8'
	push	7
	push	0
	add
	pop	in
	pop	sb[in]
	push	')'
	push	8
	push	0
	add
	pop	in
	pop	sb[in]
	push	'*'
	push	9
	push	0
	add
	pop	in
	pop	sb[in]
	push	'2'
	push	10
	push	0
	add
	pop	in
	pop	sb[in]
	push	'e'
	push	11
	push	0
	add
	pop	in
	pop	sb[in]
	push	0
	call	L512, 1
	pop	sb[12]
	push	"final result: "
	puts_
	push	sb[12]
	puti
	jmp	L999
L998:
	push	999999
	puti
L999:
