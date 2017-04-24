# A3 library - nas
nas: nas.c nas.tab.c nas.tab.h
	gcc -o nas nas.c nas.tab.c

nas.c: nas.l
	flex -o nas.c nas.l

nas.tab.h nas.tab.c: nas.y
	bison -d nas.y

cleannas:
	$(RM) nas.c nas nas.tab.c nas.tab.h


# A3 c6c
c6c: lex.yy.c y.tab.c c6c.c
	gcc -o c6c lex.yy.c y.tab.c c6c.c

lex.yy.c: c6.l
	flex c6.l

y.tab.c: c6.y
	bison -y -d c6.y


cleanc6:
	$(RM) lex.yy.c y.tab.c y.tab.h c6c

A3: nas c6c

cleanall: cleannas cleanc6
