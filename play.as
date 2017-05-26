	push	sp
	push	416
	add
	pop	sp
	push	99
	pop	sb[0]
	push	'A'
	push	0
	push	397
	add
	pop	in
	pop	sb[in]
	push	'2'
	push	1
	push	397
	add
	pop	in
	pop	sb[in]
	push	'3'
	push	2
	push	397
	add
	pop	in
	pop	sb[in]
	push	'4'
	push	3
	push	397
	add
	pop	in
	pop	sb[in]
	push	'5'
	push	4
	push	397
	add
	pop	in
	pop	sb[in]
	push	'6'
	push	5
	push	397
	add
	pop	in
	pop	sb[in]
	push	'7'
	push	6
	push	397
	add
	pop	in
	pop	sb[in]
	push	'8'
	push	7
	push	397
	add
	pop	in
	pop	sb[in]
	push	'9'
	push	8
	push	397
	add
	pop	in
	pop	sb[in]
	push	'0'
	push	9
	push	397
	add
	pop	in
	pop	sb[in]
	push	'J'
	push	10
	push	397
	add
	pop	in
	pop	sb[in]
	push	'Q'
	push	11
	push	397
	add
	pop	in
	pop	sb[in]
	push	'K'
	push	12
	push	397
	add
	pop	in
	pop	sb[in]
	push	'+'
	push	0
	push	410
	add
	pop	in
	pop	sb[in]
	push	'-'
	push	1
	push	410
	add
	pop	in
	pop	sb[in]
	push	'*'
	push	2
	push	410
	add
	pop	in
	pop	sb[in]
	push	'/'
	push	3
	push	410
	add
	pop	in
	pop	sb[in]
	push	0
	pop	sb[414]
	push	0
	pop	sb[415]
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
	jmp	L515
L514:
	push	sp
	push	58
	add
	pop	sp
	push	0
	pop	fp[0]
	push	0
	pop	fp[1]
L040:
	push	fp[1]
	push	6
	compLT
	j0	L041
	push	12
	pop	fp[2]
L043:
	push	fp[2]
	push	6
	compGT
	j0	L044
	push	0
	pop	fp[3]
L046:
	push	fp[3]
	push	6
	compLT
	j0	L047
	push	12
	pop	fp[4]
L049:
	push	fp[4]
	push	6
	compGT
	j0	L050
	push	0
	pop	fp[5]
L052:
	push	fp[5]
	push	4
	compLT
	j0	L053
	push	1
	pop	fp[6]
L055:
	push	fp[6]
	push	4
	compLT
	j0	L056
	push	2
	pop	fp[7]
L058:
	push	fp[7]
	push	4
	compLT
	j0	L059
	push	sb[414]
	push	1
	add
	pop	sb[414]
	push	sb[414]
	push	99
	compGT
	j0	L061
	jmp	L059
L061:
	push	fp[1]
	puti_
	push	fp[2]
	puti_
	push	fp[3]
	puti_
	push	fp[4]
	puti_
	push	fp[5]
	puti_
	push	fp[6]
	puti_
	push	fp[7]
	puti
	push	8
	push	3
	push	fp[-3]
	add
	add
	call	L512, 1
L060:
	push	fp[7]
	push	1
	add
	pop	fp[7]
	jmp	L058
L059:
	push	sb[414]
	push	99
	compGT
	j0	L062
	jmp	L056
L062:
L057:
	push	fp[6]
	push	1
	add
	pop	fp[6]
	jmp	L055
L056:
	push	sb[414]
	push	99
	compGT
	j0	L063
	jmp	L053
L063:
L054:
	push	fp[5]
	push	1
	add
	pop	fp[5]
	jmp	L052
L053:
	push	sb[414]
	push	99
	compGT
	j0	L064
	jmp	L050
L064:
L051:
	push	fp[4]
	push	1
	sub
	pop	fp[4]
	jmp	L049
L050:
	push	sb[414]
	push	99
	compGT
	j0	L065
	jmp	L047
L065:
L048:
	push	fp[3]
	push	1
	add
	pop	fp[3]
	jmp	L046
L047:
	push	sb[414]
	push	99
	compGT
	j0	L066
	jmp	L044
L066:
L045:
	push	fp[2]
	push	1
	sub
	pop	fp[2]
	jmp	L043
L044:
	push	sb[414]
	push	99
	compGT
	j0	L067
	jmp	L041
L067:
L042:
	push	fp[1]
	push	1
	add
	pop	fp[1]
	jmp	L040
L041:
	push	0
	ret
L515:
	call	L514, 0
	jmp	L999
L998:
	push	999999
	puti
L999:
