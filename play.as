	push	sp
	push	260
	add
	pop	sp
	push	50
	pop	sb[0]
	push	'A'
	push	0
	push	201
	add
	pop	in
	pop	sb[in]
	push	'2'
	push	1
	push	201
	add
	pop	in
	pop	sb[in]
	push	'3'
	push	2
	push	201
	add
	pop	in
	pop	sb[in]
	push	'4'
	push	3
	push	201
	add
	pop	in
	pop	sb[in]
	push	'5'
	push	4
	push	201
	add
	pop	in
	pop	sb[in]
	push	'6'
	push	5
	push	201
	add
	pop	in
	pop	sb[in]
	push	'7'
	push	6
	push	201
	add
	pop	in
	pop	sb[in]
	push	'8'
	push	7
	push	201
	add
	pop	in
	pop	sb[in]
	push	'9'
	push	8
	push	201
	add
	pop	in
	pop	sb[in]
	push	'0'
	push	9
	push	201
	add
	pop	in
	pop	sb[in]
	push	'J'
	push	10
	push	201
	add
	pop	in
	pop	sb[in]
	push	'Q'
	push	11
	push	201
	add
	pop	in
	pop	sb[in]
	push	'K'
	push	12
	push	201
	add
	pop	in
	pop	sb[in]
	push	'+'
	push	0
	push	214
	add
	pop	in
	pop	sb[in]
	push	'-'
	push	1
	push	214
	add
	pop	in
	pop	sb[in]
	push	'*'
	push	2
	push	214
	add
	pop	in
	pop	sb[in]
	push	'/'
	push	3
	push	214
	add
	pop	in
	pop	sb[in]
	push	0
	pop	sb[218]
	push	0
	pop	sb[219]
	push	'2'
	push	0
	push	220
	add
	pop	in
	pop	sb[in]
	push	'*'
	push	1
	push	220
	add
	pop	in
	pop	sb[in]
	push	'('
	push	2
	push	220
	add
	pop	in
	pop	sb[in]
	push	'3'
	push	3
	push	220
	add
	pop	in
	pop	sb[in]
	push	'+'
	push	4
	push	220
	add
	pop	in
	pop	sb[in]
	push	'4'
	push	5
	push	220
	add
	pop	in
	pop	sb[in]
	push	')'
	push	6
	push	220
	add
	pop	in
	pop	sb[in]
	push	'e'
	push	7
	push	220
	add
	pop	in
	pop	sb[in]
	push	'('
	push	0
	push	240
	add
	pop	in
	pop	sb[in]
	push	'3'
	push	1
	push	240
	add
	pop	in
	pop	sb[in]
	push	'+'
	push	2
	push	240
	add
	pop	in
	pop	sb[in]
	push	'4'
	push	3
	push	240
	add
	pop	in
	pop	sb[in]
	push	')'
	push	4
	push	240
	add
	pop	in
	pop	sb[in]
	push	'*'
	push	5
	push	240
	add
	pop	in
	pop	sb[in]
	push	'('
	push	6
	push	240
	add
	pop	in
	pop	sb[in]
	push	'1'
	push	7
	push	240
	add
	pop	in
	pop	sb[in]
	push	'+'
	push	8
	push	240
	add
	pop	in
	pop	sb[in]
	push	'1'
	push	9
	push	240
	add
	pop	in
	pop	sb[in]
	push	')'
	push	10
	push	240
	add
	pop	in
	pop	sb[in]
	push	'n'
	push	11
	push	240
	add
	pop	in
	pop	sb[in]
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
	push	1
	add
	pop	sp
	push	fp[-4]
	push	1
	sub
	push	201
	add
	pop	in
	push	sb[in]
	pop	fp[0]
	push	fp[0]
	ret
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
	j0	L013
	push	0
	ret
L013:
	push	fp[-4]
	push	'-'
	compEQ
	j0	L014
	push	1
	ret
L014:
	push	fp[-4]
	push	'*'
	compEQ
	j0	L015
	push	2
	ret
L015:
	push	fp[-4]
	push	'/'
	compEQ
	j0	L016
	push	3
	ret
L016:
L505:
	jmp	L507
L506:
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
	j0	L017
	push	0
	ret
L017:
	push	fp[-4]
	push	'+'
	compEQ
	push	fp[-4]
	push	'-'
	compEQ
	or
	j0	L018
	push	1
	ret
L018:
	push	fp[-4]
	push	'*'
	compEQ
	push	fp[-4]
	push	'/'
	compEQ
	or
	j0	L019
	push	2
	ret
L019:
L507:
	jmp	L509
L508:
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
L511:
	jmp	L513
L512:
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
L513:
	jmp	L515
L514:
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
L020:
	push	fp[102]
	push	fp[-4]
	add
	pop	in
	push	sb[in]
	push	'e'
	compNE
	j0	L021
	push	fp[102]
	push	fp[-4]
	add
	pop	in
	push	sb[in]
	pop	fp[103]
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
	j0	L022
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	push	fp[103]
	call	L500, 1
	call	L508, 3
	pop	fp[101]
L022:
	push	fp[103]
	push	'('
	compEQ
	j0	L023
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L508, 3
	pop	fp[100]
L023:
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
	j0	L024
	push	fp[100]
	push	0
	compEQ
	j0	L025
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L508, 3
	pop	fp[100]
	jmp	L026
L025:
	push	fp[103]
	call	L506, 1
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L512, 2
	call	L506, 1
	compGT
	j0	L027
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L508, 3
	pop	fp[100]
	jmp	L028
L027:
L029:
	push	fp[100]
	push	0
	compGT
	push	fp[103]
	call	L506, 1
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L512, 2
	call	L506, 1
	compLE
	and
	j0	L030
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L512, 2
	pop	fp[104]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[101]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L512, 2
	pop	fp[105]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[101]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L512, 2
	pop	fp[106]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
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
	call	L504, 1
	call	L516, 3
	call	L508, 3
	pop	fp[101]
	jmp	L029
L030:
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L508, 3
	pop	fp[100]
L028:
L026:
L024:
	push	fp[103]
	push	')'
	compEQ
	j0	L031
L032:
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L512, 2
	push	'('
	compNE
	j0	L033
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L512, 2
	pop	fp[104]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[101]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L512, 2
	pop	fp[105]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[101]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L512, 2
	pop	fp[106]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
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
	call	L504, 1
	call	L516, 3
	call	L508, 3
	pop	fp[101]
	jmp	L032
L033:
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
	pop	fp[100]
L031:
	push	fp[102]
	push	1
	add
	pop	fp[102]
	jmp	L020
L021:
L034:
	push	fp[100]
	push	0
	compGT
	j0	L035
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L512, 2
	pop	fp[104]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[101]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L512, 2
	pop	fp[105]
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L510, 2
	pop	fp[101]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L512, 2
	pop	fp[106]
	push	0
	push	4
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L510, 2
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
	call	L504, 1
	call	L516, 3
	call	L508, 3
	pop	fp[101]
	jmp	L034
L035:
	push	50
	push	4
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L512, 2
	pop	fp[107]
	push	fp[107]
	ret
L515:
	jmp	L517
L516:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	0
	compEQ
	j0	L036
	push	fp[-6]
	push	fp[-5]
	add
	ret
	jmp	L037
L036:
	push	fp[-4]
	push	1
	compEQ
	j0	L038
	push	fp[-6]
	push	fp[-5]
	sub
	ret
	jmp	L039
L038:
	push	fp[-4]
	push	2
	compEQ
	j0	L040
	push	fp[-6]
	push	fp[-5]
	mul
	ret
	jmp	L041
L040:
	push	fp[-4]
	push	3
	compEQ
	j0	L042
	push	fp[-5]
	push	0
	compEQ
	j0	L043
	push	0
	ret
	jmp	L044
L043:
	push	fp[-6]
	push	fp[-5]
	div
	ret
L044:
	jmp	L045
L042:
	push	0
	ret
L045:
L041:
L039:
L037:
L517:
	jmp	L519
L518:
	push	sp
	push	3
	add
	pop	sp
	push	fp[-10]
	push	fp[-9]
	push	fp[-6]
	call	L516, 3
	pop	fp[0]
	push	fp[0]
	push	fp[-8]
	push	fp[-5]
	call	L516, 3
	pop	fp[1]
	push	fp[1]
	push	fp[-7]
	push	fp[-4]
	call	L516, 3
	pop	fp[2]
	push	fp[2]
	ret
L519:
	jmp	L521
L520:
	push	sp
	push	3
	add
	pop	sp
	push	fp[-9]
	push	fp[-8]
	push	fp[-5]
	call	L516, 3
	pop	fp[0]
	push	fp[-10]
	push	fp[0]
	push	fp[-6]
	call	L516, 3
	pop	fp[1]
	push	fp[1]
	push	fp[-7]
	push	fp[-4]
	call	L516, 3
	pop	fp[2]
	push	fp[2]
	ret
L521:
	jmp	L523
L522:
	push	sp
	push	3
	add
	pop	sp
	push	fp[-8]
	push	fp[-7]
	push	fp[-4]
	call	L516, 3
	pop	fp[0]
	push	fp[-9]
	push	fp[0]
	push	fp[-5]
	call	L516, 3
	pop	fp[1]
	push	fp[-10]
	push	fp[1]
	push	fp[-6]
	call	L516, 3
	pop	fp[2]
	push	fp[2]
	ret
L523:
	jmp	L525
L524:
	push	sp
	push	3
	add
	pop	sp
	push	fp[-9]
	push	fp[-8]
	push	fp[-5]
	call	L516, 3
	pop	fp[0]
	push	fp[0]
	push	fp[-7]
	push	fp[-4]
	call	L516, 3
	pop	fp[1]
	push	fp[-10]
	push	fp[1]
	push	fp[-6]
	call	L516, 3
	pop	fp[2]
	push	fp[2]
	ret
L525:
	jmp	L527
L526:
	push	sp
	push	3
	add
	pop	sp
	push	fp[-10]
	push	fp[-9]
	push	fp[-6]
	call	L516, 3
	pop	fp[0]
	push	fp[-8]
	push	fp[-7]
	push	fp[-4]
	call	L516, 3
	pop	fp[1]
	push	fp[0]
	push	fp[1]
	push	fp[-5]
	call	L516, 3
	pop	fp[2]
	push	fp[2]
	ret
L527:
	jmp	L529
L528:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	0
	compEQ
	j0	L046
	push	'+'
	ret
	jmp	L047
L046:
	push	fp[-4]
	push	1
	compEQ
	j0	L048
	push	'-'
	ret
	jmp	L049
L048:
	push	fp[-4]
	push	2
	compEQ
	j0	L050
	push	'*'
	ret
	jmp	L051
L050:
	push	fp[-4]
	push	3
	compEQ
	j0	L052
	push	'/'
	ret
	jmp	L053
L052:
	push	''
	ret
L053:
L051:
L049:
L047:
L529:
	jmp	L531
L530:
	push	sp
	push	3
	add
	pop	sp
	push	0
	pop	fp[0]
L054:
	push	fp[0]
	push	4
	compLT
	j0	L055
	push	0
	pop	fp[1]
L057:
	push	fp[1]
	push	4
	compLT
	j0	L058
	push	0
	pop	fp[2]
L060:
	push	fp[2]
	push	4
	compLT
	j0	L061
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L518, 7
	push	24
	compEQ
	j0	L063
	push	'('
	putc_
	push	'('
	putc_
	push	fp[-7]
	puti_
	push	fp[0]
	call	L528, 1
	putc_
	push	fp[-6]
	puti_
	push	')'
	putc_
	push	fp[1]
	call	L528, 1
	putc_
	push	fp[-5]
	puti_
	push	')'
	putc_
	push	fp[2]
	call	L528, 1
	putc_
	push	fp[-4]
	puti
L063:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L520, 7
	push	24
	compEQ
	j0	L064
	push	'('
	putc_
	push	fp[-7]
	puti_
	push	fp[0]
	call	L528, 1
	putc_
	push	'('
	putc_
	push	fp[-6]
	puti_
	push	fp[1]
	call	L528, 1
	putc_
	push	fp[-5]
	puti_
	push	')'
	putc_
	push	')'
	putc_
	push	fp[2]
	call	L528, 1
	putc_
	push	fp[-4]
	puti
L064:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L522, 7
	push	24
	compEQ
	j0	L065
	push	fp[-7]
	puti_
	push	fp[0]
	call	L528, 1
	putc_
	push	'('
	putc_
	push	fp[-6]
	puti_
	push	fp[1]
	call	L528, 1
	putc_
	push	'('
	putc_
	push	fp[-5]
	puti_
	push	fp[2]
	call	L528, 1
	putc_
	push	fp[-4]
	puti_
	push	')'
	putc_
	push	')'
	putc
L065:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L524, 7
	push	24
	compEQ
	j0	L066
	push	fp[-7]
	puti_
	push	fp[0]
	call	L528, 1
	putc_
	push	'('
	putc_
	push	'('
	putc_
	push	fp[-6]
	puti_
	push	fp[1]
	call	L528, 1
	putc_
	push	fp[-5]
	puti_
	push	')'
	putc_
	push	fp[2]
	call	L528, 1
	putc_
	push	fp[-4]
	puti_
	push	')'
	putc
L066:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L526, 7
	push	24
	compEQ
	j0	L067
	push	'('
	putc_
	push	fp[-7]
	puti_
	push	fp[0]
	call	L528, 1
	putc_
	push	fp[-6]
	puti_
	push	')'
	putc_
	push	fp[1]
	call	L528, 1
	putc_
	push	'('
	putc_
	push	fp[-5]
	puti_
	push	fp[2]
	call	L528, 1
	putc_
	push	fp[-4]
	puti_
	push	')'
	putc
L067:
L062:
	push	fp[2]
	push	1
	add
	pop	fp[2]
	jmp	L060
L061:
L059:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L057
L058:
L056:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L054
L055:
	push	0
	ret
L531:
	jmp	L533
L532:
	push	sp
	push	3
	add
	pop	sp
	push	0
	pop	fp[0]
L068:
	push	fp[0]
	push	4
	compLT
	j0	L069
	push	0
	pop	fp[1]
L071:
	push	fp[1]
	push	4
	compLT
	j0	L072
	push	0
	pop	fp[2]
L074:
	push	fp[2]
	push	4
	compLT
	j0	L075
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L518, 7
	push	24
	compEQ
	j0	L077
	push	1
	ret
L077:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L520, 7
	push	24
	compEQ
	j0	L078
	push	1
	ret
L078:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L522, 7
	push	24
	compEQ
	j0	L079
	push	1
	ret
L079:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L524, 7
	push	24
	compEQ
	j0	L080
	push	1
	ret
L080:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L526, 7
	push	24
	compEQ
	j0	L081
	push	1
	ret
L081:
	push	0
	ret
L076:
	push	fp[2]
	push	1
	add
	pop	fp[2]
	jmp	L074
L075:
L073:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L071
L072:
L070:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L068
L069:
L533:
	jmp	L535
L534:
	push	sp
	push	5
	add
	pop	sp
	push	0
	pop	fp[0]
	push	1
	pop	fp[1]
L082:
	push	fp[1]
	push	14
	compLT
	j0	L083
	push	1
	pop	fp[2]
L085:
	push	fp[2]
	push	14
	compLT
	j0	L086
	push	1
	pop	fp[3]
L088:
	push	fp[3]
	push	14
	compLT
	j0	L089
	push	1
	pop	fp[4]
L091:
	push	fp[4]
	push	14
	compLT
	j0	L092
	push	fp[1]
	push	fp[2]
	compEQ
	push	fp[2]
	push	fp[3]
	compEQ
	or
	push	fp[3]
	push	fp[4]
	compEQ
	or
	push	fp[1]
	push	fp[3]
	compEQ
	or
	push	fp[1]
	push	fp[4]
	compEQ
	or
	push	fp[2]
	push	fp[4]
	compEQ
	or
	j0	L094
	jmp	L093
L094:
	push	fp[1]
	push	fp[2]
	push	fp[3]
	push	fp[4]
	call	L532, 4
	push	1
	compEQ
	j0	L095
	push	fp[1]
	push	0
	push	fp[0]
	push	4
	mul
	add
	push	1
	add
	pop	in
	pop	sb[in]
	push	fp[2]
	push	1
	push	fp[0]
	push	4
	mul
	add
	push	1
	add
	pop	in
	pop	sb[in]
	push	fp[3]
	push	2
	push	fp[0]
	push	4
	mul
	add
	push	1
	add
	pop	in
	pop	sb[in]
	push	fp[4]
	push	3
	push	fp[0]
	push	4
	mul
	add
	push	1
	add
	pop	in
	pop	sb[in]
	push	fp[0]
	push	1
	add
	pop	fp[0]
	push	fp[0]
	push	sb[0]
	compGE
	j0	L096
	push	0
	ret
L096:
	push	fp[1]
	puti_
	push	' '
	putc_
	push	fp[2]
	puti_
	push	' '
	putc_
	push	fp[3]
	puti_
	push	' '
	putc_
	push	fp[4]
	puti
L095:
L093:
	push	fp[4]
	push	1
	add
	pop	fp[4]
	jmp	L091
L092:
L090:
	push	fp[3]
	push	1
	add
	pop	fp[3]
	jmp	L088
L089:
L087:
	push	fp[2]
	push	1
	add
	pop	fp[2]
	jmp	L085
L086:
L084:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L082
L083:
L535:
	jmp	L537
L536:
	push	sp
	push	2
	add
	pop	sp
	push	0
	pop	fp[0]
L097:
	push	fp[0]
	push	sb[0]
	compLT
	j0	L098
	push	0
	pop	fp[1]
L100:
	push	fp[1]
	push	4
	compLT
	j0	L101
	push	fp[1]
	push	fp[0]
	push	4
	mul
	add
	push	1
	add
	pop	in
	push	sb[in]
	puti_
	push	' '
	putc_
L102:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L100
L101:
	push	' '
	putc
L099:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L097
L098:
	push	0
	ret
L537:
	push	220
	call	L514, 1
	puti
	call	L534, 0
	call	L536, 0
	jmp	L999
L998:
	push	999999
	puti
L999:
