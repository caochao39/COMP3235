	push	sp
	push	251
	add
	pop	sp
	push	50
	pop	sb[0]
	push	's'
	pop	sb[1]
	push	'A'
	push	0
	push	202
	add
	pop	in
	pop	sb[in]
	push	'2'
	push	1
	push	202
	add
	pop	in
	pop	sb[in]
	push	'3'
	push	2
	push	202
	add
	pop	in
	pop	sb[in]
	push	'4'
	push	3
	push	202
	add
	pop	in
	pop	sb[in]
	push	'5'
	push	4
	push	202
	add
	pop	in
	pop	sb[in]
	push	'6'
	push	5
	push	202
	add
	pop	in
	pop	sb[in]
	push	'7'
	push	6
	push	202
	add
	pop	in
	pop	sb[in]
	push	'8'
	push	7
	push	202
	add
	pop	in
	pop	sb[in]
	push	'9'
	push	8
	push	202
	add
	pop	in
	pop	sb[in]
	push	'0'
	push	9
	push	202
	add
	pop	in
	pop	sb[in]
	push	'J'
	push	10
	push	202
	add
	pop	in
	pop	sb[in]
	push	'Q'
	push	11
	push	202
	add
	pop	in
	pop	sb[in]
	push	'K'
	push	12
	push	202
	add
	pop	in
	pop	sb[in]
	push	'+'
	push	0
	push	215
	add
	pop	in
	pop	sb[in]
	push	'-'
	push	1
	push	215
	add
	pop	in
	pop	sb[in]
	push	'*'
	push	2
	push	215
	add
	pop	in
	pop	sb[in]
	push	'/'
	push	3
	push	215
	add
	pop	in
	pop	sb[in]
	push	0
	pop	sb[223]
	push	0
	pop	sb[224]
	push	0
	pop	sb[225]
	push	'('
	push	0
	push	226
	add
	pop	in
	pop	sb[in]
	push	'('
	push	1
	push	226
	add
	pop	in
	pop	sb[in]
	push	'Q'
	push	2
	push	226
	add
	pop	in
	pop	sb[in]
	push	'-'
	push	3
	push	226
	add
	pop	in
	pop	sb[in]
	push	'2'
	push	4
	push	226
	add
	pop	in
	pop	sb[in]
	push	')'
	push	5
	push	226
	add
	pop	in
	pop	sb[in]
	push	'+'
	push	6
	push	226
	add
	pop	in
	pop	sb[in]
	push	'K'
	push	7
	push	226
	add
	pop	in
	pop	sb[in]
	push	'+'
	push	8
	push	226
	add
	pop	in
	pop	sb[in]
	push	'A'
	push	9
	push	226
	add
	pop	in
	pop	sb[in]
	push	')'
	push	10
	push	226
	add
	pop	in
	pop	sb[in]
	push	'e'
	push	11
	push	226
	add
	pop	in
	pop	sb[in]
	jmp	L501
L500:
	push	sp
	push	1
	add
	pop	sp
	push	0
	pop	fp[0]
L000:
	push	fp[0]
	push	20
	compLT
	j0	L001
	push	'e'
	push	fp[0]
	push	226
	add
	pop	in
	pop	sb[in]
L002:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L000
L001:
	push	0
	ret
L501:
	jmp	L503
L502:
	push	sp
	push	1
	add
	pop	sp
	push	0
	pop	fp[0]
L003:
	push	fp[0]
	push	20
	compLT
	j0	L004
	push	fp[0]
	push	226
	add
	pop	in
	push	sb[in]
	putc_
L005:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L003
L004:
	push	''
	putc
	push	0
	ret
L503:
	jmp	L505
L504:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	'A'
	compEQ
	j0	L006
	push	1
	ret
L006:
	push	fp[-4]
	push	'2'
	compEQ
	j0	L007
	push	2
	ret
L007:
	push	fp[-4]
	push	'3'
	compEQ
	j0	L008
	push	3
	ret
L008:
	push	fp[-4]
	push	'4'
	compEQ
	j0	L009
	push	4
	ret
L009:
	push	fp[-4]
	push	'5'
	compEQ
	j0	L010
	push	5
	ret
L010:
	push	fp[-4]
	push	'6'
	compEQ
	j0	L011
	push	6
	ret
L011:
	push	fp[-4]
	push	'7'
	compEQ
	j0	L012
	push	7
	ret
L012:
	push	fp[-4]
	push	'8'
	compEQ
	j0	L013
	push	8
	ret
L013:
	push	fp[-4]
	push	'9'
	compEQ
	j0	L014
	push	9
	ret
L014:
	push	fp[-4]
	push	'0'
	compEQ
	j0	L015
	push	10
	ret
L015:
	push	fp[-4]
	push	'J'
	compEQ
	j0	L016
	push	11
	ret
L016:
	push	fp[-4]
	push	'Q'
	compEQ
	j0	L017
	push	12
	ret
L017:
	push	fp[-4]
	push	'K'
	compEQ
	j0	L018
	push	13
	ret
L018:
L505:
	jmp	L507
L506:
	push	sp
	push	1
	add
	pop	sp
	push	fp[-4]
	push	1
	sub
	push	202
	add
	pop	in
	push	sb[in]
	pop	fp[0]
	push	fp[0]
	ret
L507:
	jmp	L509
L508:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	'+'
	compEQ
	j0	L019
	push	0
	ret
L019:
	push	fp[-4]
	push	'-'
	compEQ
	j0	L020
	push	1
	ret
L020:
	push	fp[-4]
	push	'*'
	compEQ
	j0	L021
	push	2
	ret
L021:
	push	fp[-4]
	push	'/'
	compEQ
	j0	L022
	push	3
	ret
L022:
L509:
	jmp	L511
L510:
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
	j0	L023
	push	0
	ret
L023:
	push	fp[-4]
	push	'+'
	compEQ
	push	fp[-4]
	push	'-'
	compEQ
	or
	j0	L024
	push	1
	ret
L024:
	push	fp[-4]
	push	'*'
	compEQ
	push	fp[-4]
	push	'/'
	compEQ
	or
	j0	L025
	push	2
	ret
L025:
L511:
	jmp	L513
L512:
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
L513:
	jmp	L515
L514:
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
L515:
	jmp	L517
L516:
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
L517:
	jmp	L519
L518:
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
L026:
	push	1
	j0	L027
	push	fp[102]
	push	226
	add
	pop	in
	push	sb[in]
	pop	fp[103]
	push	fp[103]
	push	'e'
	compEQ
	j0	L028
	jmp	L027
L028:
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
	j0	L029
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	push	fp[103]
	call	L504, 1
	call	L512, 3
	pop	fp[101]
L029:
	push	fp[103]
	push	'('
	compEQ
	j0	L030
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L512, 3
	pop	fp[100]
L030:
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
	j0	L031
	push	fp[100]
	push	0
	compEQ
	j0	L032
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L512, 3
	pop	fp[100]
	jmp	L033
L032:
	push	fp[103]
	call	L510, 1
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L516, 2
	call	L510, 1
	compGT
	j0	L034
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L512, 3
	pop	fp[100]
	jmp	L035
L034:
L036:
	push	fp[100]
	push	0
	compGT
	push	fp[103]
	call	L510, 1
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L516, 2
	call	L510, 1
	compLE
	and
	j0	L037
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L516, 2
	pop	fp[104]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L514, 2
	pop	fp[101]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L516, 2
	pop	fp[105]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L514, 2
	pop	fp[101]
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L516, 2
	pop	fp[106]
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L514, 2
	pop	fp[100]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	push	fp[105]
	push	fp[104]
	push	fp[106]
	call	L508, 1
	call	L520, 3
	call	L512, 3
	pop	fp[101]
	jmp	L036
L037:
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	push	fp[103]
	call	L512, 3
	pop	fp[100]
L035:
L033:
L031:
	push	fp[103]
	push	')'
	compEQ
	j0	L038
L039:
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L516, 2
	push	'('
	compNE
	j0	L040
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L516, 2
	pop	fp[104]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L514, 2
	pop	fp[101]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L516, 2
	pop	fp[105]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L514, 2
	pop	fp[101]
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L516, 2
	pop	fp[106]
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L514, 2
	pop	fp[100]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	push	fp[105]
	push	fp[104]
	push	fp[106]
	call	L508, 1
	call	L520, 3
	call	L512, 3
	pop	fp[101]
	jmp	L039
L040:
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L514, 2
	pop	fp[100]
L038:
	push	fp[102]
	push	1
	add
	pop	fp[102]
	jmp	L026
L027:
L041:
	push	fp[100]
	push	0
	compGT
	j0	L042
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L516, 2
	pop	fp[104]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L514, 2
	pop	fp[101]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L516, 2
	pop	fp[105]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L514, 2
	pop	fp[101]
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L516, 2
	pop	fp[106]
	push	0
	push	3
	push	fp[-3]
	add
	add
	push	fp[100]
	call	L514, 2
	pop	fp[100]
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	push	fp[105]
	push	fp[104]
	push	fp[106]
	call	L508, 1
	call	L520, 3
	call	L512, 3
	pop	fp[101]
	jmp	L041
L042:
	push	50
	push	3
	push	fp[-3]
	add
	add
	push	fp[101]
	call	L516, 2
	pop	fp[107]
	push	fp[107]
	ret
L519:
	jmp	L521
L520:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	0
	compEQ
	j0	L043
	push	fp[-6]
	push	fp[-5]
	add
	ret
	jmp	L044
L043:
	push	fp[-4]
	push	1
	compEQ
	j0	L045
	push	fp[-6]
	push	fp[-5]
	sub
	ret
	jmp	L046
L045:
	push	fp[-4]
	push	2
	compEQ
	j0	L047
	push	fp[-6]
	push	fp[-5]
	mul
	ret
	jmp	L048
L047:
	push	fp[-4]
	push	3
	compEQ
	j0	L049
	push	fp[-5]
	push	0
	compEQ
	j0	L050
	push	0
	ret
	jmp	L051
L050:
	push	fp[-6]
	push	fp[-5]
	div
	ret
L051:
	jmp	L052
L049:
	push	0
	ret
L052:
L048:
L046:
L044:
L521:
	jmp	L523
L522:
	push	sp
	push	3
	add
	pop	sp
	push	fp[-10]
	push	fp[-9]
	push	fp[-6]
	call	L520, 3
	pop	fp[0]
	push	fp[0]
	push	fp[-8]
	push	fp[-5]
	call	L520, 3
	pop	fp[1]
	push	fp[1]
	push	fp[-7]
	push	fp[-4]
	call	L520, 3
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
	call	L520, 3
	pop	fp[0]
	push	fp[-10]
	push	fp[0]
	push	fp[-6]
	call	L520, 3
	pop	fp[1]
	push	fp[1]
	push	fp[-7]
	push	fp[-4]
	call	L520, 3
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
	push	fp[-8]
	push	fp[-7]
	push	fp[-4]
	call	L520, 3
	pop	fp[0]
	push	fp[-9]
	push	fp[0]
	push	fp[-5]
	call	L520, 3
	pop	fp[1]
	push	fp[-10]
	push	fp[1]
	push	fp[-6]
	call	L520, 3
	pop	fp[2]
	push	fp[2]
	ret
L527:
	jmp	L529
L528:
	push	sp
	push	3
	add
	pop	sp
	push	fp[-9]
	push	fp[-8]
	push	fp[-5]
	call	L520, 3
	pop	fp[0]
	push	fp[0]
	push	fp[-7]
	push	fp[-4]
	call	L520, 3
	pop	fp[1]
	push	fp[-10]
	push	fp[1]
	push	fp[-6]
	call	L520, 3
	pop	fp[2]
	push	fp[2]
	ret
L529:
	jmp	L531
L530:
	push	sp
	push	3
	add
	pop	sp
	push	fp[-10]
	push	fp[-9]
	push	fp[-6]
	call	L520, 3
	pop	fp[0]
	push	fp[-8]
	push	fp[-7]
	push	fp[-4]
	call	L520, 3
	pop	fp[1]
	push	fp[0]
	push	fp[1]
	push	fp[-5]
	call	L520, 3
	pop	fp[2]
	push	fp[2]
	ret
L531:
	jmp	L533
L532:
	push	sp
	push	0
	add
	pop	sp
	push	fp[-4]
	push	0
	compEQ
	j0	L053
	push	'+'
	ret
	jmp	L054
L053:
	push	fp[-4]
	push	1
	compEQ
	j0	L055
	push	'-'
	ret
	jmp	L056
L055:
	push	fp[-4]
	push	2
	compEQ
	j0	L057
	push	'*'
	ret
	jmp	L058
L057:
	push	fp[-4]
	push	3
	compEQ
	j0	L059
	push	'/'
	ret
	jmp	L060
L059:
	push	''
	ret
L060:
L058:
L056:
L054:
L533:
	jmp	L535
L534:
	push	sp
	push	3
	add
	pop	sp
	push	0
	pop	fp[0]
L061:
	push	fp[0]
	push	4
	compLT
	j0	L062
	push	0
	pop	fp[1]
L064:
	push	fp[1]
	push	4
	compLT
	j0	L065
	push	0
	pop	fp[2]
L067:
	push	fp[2]
	push	4
	compLT
	j0	L068
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
	j0	L070
	push	'('
	putc_
	push	'('
	putc_
	push	fp[-7]
	call	L506, 1
	putc_
	push	fp[0]
	call	L532, 1
	putc_
	push	fp[-6]
	call	L506, 1
	putc_
	push	')'
	putc_
	push	fp[1]
	call	L532, 1
	putc_
	push	fp[-5]
	call	L506, 1
	putc_
	push	')'
	putc_
	push	fp[2]
	call	L532, 1
	putc_
	push	fp[-4]
	call	L506, 1
	putc
L070:
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
	j0	L071
	push	'('
	putc_
	push	fp[-7]
	call	L506, 1
	putc_
	push	fp[0]
	call	L532, 1
	putc_
	push	'('
	putc_
	push	fp[-6]
	call	L506, 1
	putc_
	push	fp[1]
	call	L532, 1
	putc_
	push	fp[-5]
	call	L506, 1
	putc_
	push	')'
	putc_
	push	')'
	putc_
	push	fp[2]
	call	L532, 1
	putc_
	push	fp[-4]
	call	L506, 1
	putc
L071:
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
	j0	L072
	push	fp[-7]
	call	L506, 1
	putc_
	push	fp[0]
	call	L532, 1
	putc_
	push	'('
	putc_
	push	fp[-6]
	call	L506, 1
	putc_
	push	fp[1]
	call	L532, 1
	putc_
	push	'('
	putc_
	push	fp[-5]
	call	L506, 1
	putc_
	push	fp[2]
	call	L532, 1
	putc_
	push	fp[-4]
	call	L506, 1
	putc_
	push	')'
	putc_
	push	')'
	putc
L072:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L528, 7
	push	24
	compEQ
	j0	L073
	push	fp[-7]
	call	L506, 1
	putc_
	push	fp[0]
	call	L532, 1
	putc_
	push	'('
	putc_
	push	'('
	putc_
	push	fp[-6]
	call	L506, 1
	putc_
	push	fp[1]
	call	L532, 1
	putc_
	push	fp[-5]
	call	L506, 1
	putc_
	push	')'
	putc_
	push	fp[2]
	call	L532, 1
	putc_
	push	fp[-4]
	call	L506, 1
	putc_
	push	')'
	putc
L073:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L530, 7
	push	24
	compEQ
	j0	L074
	push	'('
	putc_
	push	fp[-7]
	call	L506, 1
	putc_
	push	fp[0]
	call	L532, 1
	putc_
	push	fp[-6]
	call	L506, 1
	putc_
	push	')'
	putc_
	push	fp[1]
	call	L532, 1
	putc_
	push	'('
	putc_
	push	fp[-5]
	call	L506, 1
	putc_
	push	fp[2]
	call	L532, 1
	putc_
	push	fp[-4]
	call	L506, 1
	putc_
	push	')'
	putc
L074:
L069:
	push	fp[2]
	push	1
	add
	pop	fp[2]
	jmp	L067
L068:
L066:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L064
L065:
L063:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L061
L062:
	push	0
	ret
L535:
	jmp	L537
L536:
	push	sp
	push	3
	add
	pop	sp
	push	0
	pop	fp[0]
L075:
	push	fp[0]
	push	4
	compLT
	j0	L076
	push	0
	pop	fp[1]
L078:
	push	fp[1]
	push	4
	compLT
	j0	L079
	push	0
	pop	fp[2]
L081:
	push	fp[2]
	push	4
	compLT
	j0	L082
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
	j0	L084
	push	1
	ret
L084:
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
	j0	L085
	push	1
	ret
L085:
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
	j0	L086
	push	1
	ret
L086:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L528, 7
	push	24
	compEQ
	j0	L087
	push	1
	ret
L087:
	push	fp[-7]
	push	fp[-6]
	push	fp[-5]
	push	fp[-4]
	push	fp[0]
	push	fp[1]
	push	fp[2]
	call	L530, 7
	push	24
	compEQ
	j0	L088
	push	1
	ret
L088:
L083:
	push	fp[2]
	push	1
	add
	pop	fp[2]
	jmp	L081
L082:
L080:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L078
L079:
L077:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L075
L076:
	push	0
	ret
L537:
	jmp	L539
L538:
	push	sp
	push	0
	add
	pop	sp
	push	0
	push	fp[-5]
	push	4
	mul
	add
	push	fp[-4]
	add
	pop	in
	push	sb[in]
	push	0
	push	219
	add
	pop	in
	pop	sb[in]
	push	1
	push	fp[-5]
	push	4
	mul
	add
	push	fp[-4]
	add
	pop	in
	push	sb[in]
	push	1
	push	219
	add
	pop	in
	pop	sb[in]
	push	2
	push	fp[-5]
	push	4
	mul
	add
	push	fp[-4]
	add
	pop	in
	push	sb[in]
	push	2
	push	219
	add
	pop	in
	pop	sb[in]
	push	3
	push	fp[-5]
	push	4
	mul
	add
	push	fp[-4]
	add
	pop	in
	push	sb[in]
	push	3
	push	219
	add
	pop	in
	pop	sb[in]
	push	0
	ret
L539:
	jmp	L541
L540:
	push	sp
	push	5
	add
	pop	sp
	push	0
	pop	fp[0]
	push	1
	pop	fp[1]
L089:
	push	fp[1]
	push	14
	compLT
	j0	L090
	push	1
	pop	fp[2]
L092:
	push	fp[2]
	push	14
	compLT
	j0	L093
	push	1
	pop	fp[3]
L095:
	push	fp[3]
	push	14
	compLT
	j0	L096
	push	1
	pop	fp[4]
L098:
	push	fp[4]
	push	14
	compLT
	j0	L099
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
	j0	L101
	jmp	L100
L101:
	push	fp[1]
	push	fp[2]
	push	fp[3]
	push	fp[4]
	call	L536, 4
	push	1
	compEQ
	j0	L102
	push	fp[1]
	push	0
	push	fp[0]
	push	4
	mul
	add
	push	2
	add
	pop	in
	pop	sb[in]
	push	fp[2]
	push	1
	push	fp[0]
	push	4
	mul
	add
	push	2
	add
	pop	in
	pop	sb[in]
	push	fp[3]
	push	2
	push	fp[0]
	push	4
	mul
	add
	push	2
	add
	pop	in
	pop	sb[in]
	push	fp[4]
	push	3
	push	fp[0]
	push	4
	mul
	add
	push	2
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
	j0	L103
	push	0
	ret
L103:
L102:
L100:
	push	fp[4]
	push	1
	add
	pop	fp[4]
	jmp	L098
L099:
L097:
	push	fp[3]
	push	1
	add
	pop	fp[3]
	jmp	L095
L096:
L094:
	push	fp[2]
	push	1
	add
	pop	fp[2]
	jmp	L092
L093:
L091:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L089
L090:
L541:
	jmp	L543
L542:
	push	sp
	push	2
	add
	pop	sp
	push	0
	pop	fp[0]
L104:
	push	fp[0]
	push	sb[0]
	compLT
	j0	L105
	push	0
	pop	fp[1]
L107:
	push	fp[1]
	push	4
	compLT
	j0	L108
	push	fp[1]
	push	fp[0]
	push	4
	mul
	add
	push	2
	add
	pop	in
	push	sb[in]
	puti_
	push	' '
	putc_
L109:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L107
L108:
	push	' '
	putc
L106:
	push	fp[0]
	push	1
	add
	pop	fp[0]
	jmp	L104
L105:
	push	0
	ret
L543:
	jmp	L545
L544:
	push	sp
	push	3
	add
	pop	sp
	push	0
	pop	fp[0]
	push	0
	pop	fp[1]
L110:
	push	fp[1]
	push	20
	compLT
	j0	L111
	push	0
	pop	fp[2]
L113:
	push	fp[2]
	push	4
	compLT
	j0	L114
	push	fp[2]
	push	219
	add
	pop	in
	push	sb[in]
	call	L506, 1
	push	fp[1]
	push	226
	add
	pop	in
	push	sb[in]
	compEQ
	j0	L116
	push	fp[0]
	push	1
	add
	pop	fp[0]
L116:
L115:
	push	fp[2]
	push	1
	add
	pop	fp[2]
	jmp	L113
L114:
L112:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L110
L111:
	push	fp[0]
	push	4
	compEQ
	j0	L117
	push	1
	ret
	jmp	L118
L117:
	push	0
	ret
L118:
L545:
	call	L540, 0
L119:
	push	1
	j0	L120
	push	"please press 's' to start and any other key to exit:"
	puts
	getc
	pop	sb[246]
	push	sb[246]
	push	's'
	compNE
	j0	L121
	jmp	L120
L121:
	push	"please input question no (0~49): "
	puts_
	geti
	pop	sb[247]
L122:
	push	sb[247]
	push	49
	compGT
	push	sb[247]
	push	0
	compLT
	or
	j0	L123
	push	"Sorry, please input a valid question no (0~49): "
	puts_
	geti
	pop	sb[247]
	jmp	L122
L123:
	push	sb[247]
	push	2
	call	L538, 2
	push	"=========================="
	puts
	push	0
	push	219
	add
	pop	in
	push	sb[in]
	call	L506, 1
	putc_
	push	'\t'
	putc_
	push	1
	push	219
	add
	pop	in
	push	sb[in]
	call	L506, 1
	putc_
	push	'\t'
	putc_
	push	2
	push	219
	add
	pop	in
	push	sb[in]
	call	L506, 1
	putc_
	push	'\t'
	putc_
	push	3
	push	219
	add
	pop	in
	push	sb[in]
	call	L506, 1
	putc
	push	"=========================="
	puts
	push	"[please notice: 0 represents 10]\n"
	puts
	push	"Please input your calculation, or press 'h' to checkout the solutions."
	puts
	push	"[Please use 'A', '0', 'J', 'Q', 'K' to denote 1, 10, 11, 12, 13]"
	puts
	push	"[You can use '+', '-', '*', '/' and '()' for calculation]"
	puts
	push	"[Press Enter to submit.]"
	puts
	push	1
	pop	sb[248]
	push	1
	pop	sb[249]
	call	L500, 0
	push	'('
	push	0
	push	226
	add
	pop	in
	pop	sb[in]
	getc
	pop	sb[246]
L124:
	push	sb[246]
	push	'\n'
	compNE
	j0	L125
	push	sb[246]
	push	sb[248]
	push	226
	add
	pop	in
	pop	sb[in]
	push	sb[248]
	push	1
	add
	pop	sb[248]
	getc
	pop	sb[246]
	jmp	L124
L125:
	push	')'
	push	sb[248]
	push	226
	add
	pop	in
	pop	sb[in]
	push	1
	push	226
	add
	pop	in
	push	sb[in]
	push	'h'
	compEQ
	push	sb[249]
	push	0
	compEQ
	or
	j0	L126
	push	"This problem can be solved as: "
	puts
	push	0
	push	219
	add
	pop	in
	push	sb[in]
	push	1
	push	219
	add
	pop	in
	push	sb[in]
	push	2
	push	219
	add
	pop	in
	push	sb[in]
	push	3
	push	219
	add
	pop	in
	push	sb[in]
	call	L534, 4
	jmp	L127
L126:
	push	"computation result: "
	puts
	call	L518, 0
	pop	sb[250]
	push	sb[250]
	puti
	push	sb[250]
	push	24
	compEQ
	call	L544, 0
	push	1
	compEQ
	and
	j0	L128
	push	"Congradulations!"
	puts
	push	sb[224]
	push	1
	add
	pop	sb[224]
	push	"Your current score: "
	puts_
	push	sb[224]
	puti
	jmp	L129
L128:
	push	sb[250]
	push	24
	compNE
	j0	L130
	push	"Sorry, the answer is not corret."
	puts
	push	"Your current score: "
	puts_
	push	sb[224]
	puti
	jmp	L131
L130:
	call	L544, 0
	push	0
	compEQ
	j0	L132
	push	"Sorry, the answer is not valid for the current question."
	puts
	push	"Your current score: "
	puts_
	push	sb[224]
	puti
L132:
L131:
L129:
L127:
	jmp	L119
L120:
	jmp	L999
L998:
	push	999999
	puti
L999:
