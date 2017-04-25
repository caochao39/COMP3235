%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "calc3.h"


/* prototypes */
nodeType *opr(int oper, int nops, ...);
nodeType *id(int i);
nodeType *con(int value);
nodeType *strCon(char *value);
void freeNode(nodeType *p);
int ex(nodeType *p, int, int);
void eop();
int yylex(void);

void yyerror(char *s);
int sym[26];                    /* symbol table */
%}

%union {
    int iValue;                 /* integer value */
    char *sValue;		/* address of the string */
    char sIndex;                /* symbol table index */
    nodeType *nPtr;             /* node pointer */
};

%token <iValue> INTEGER 
%token <sValue> STRING
%token <sIndex> VARIABLE
%token FOR WHILE IF PRINT READ BREAK CONTINUE OFFSET RVALUE
%nonassoc IFX
%nonassoc ELSE

%left AND OR

%left GE LE EQ NE '>' '<'
%left '+' '-'
%left '*' '/' '%'
%nonassoc UMINUS

%type <nPtr> stmt allexpr expr stmt_list vari

%%

program:
        function                { eop(); exit(0); }
        ;

function:
          function stmt         { ex($2,998,998); freeNode($2); }
        | /* NULL */
        ;

stmt:
          ';'                                 { $$ = opr(';', 2, NULL, NULL); }
        | allexpr ';'                            { $$ = $1; }
        | PRINT allexpr ';'                      { $$ = opr(PRINT, 1, $2); }
        | READ vari ';'                       { $$ = opr(READ, 1, $2); }
        | vari '=' allexpr ';'                   { $$ = opr('=', 2, $1, $3); }
        | FOR '(' stmt stmt stmt ')' stmt     { $$ = opr(FOR, 4, $3, $4, $5, $7); }
        | WHILE '(' allexpr ')' stmt             { $$ = opr(WHILE, 2, $3, $5); }
        | IF '(' allexpr ')' stmt %prec IFX      { $$ = opr(IF, 2, $3, $5); }
        | IF '(' allexpr ')' stmt ELSE stmt      { $$ = opr(IF, 3, $3, $5, $7); }
        | '{' stmt_list '}'                   { $$ = $2; }
        | BREAK ';'                           { $$ = opr(BREAK, 0); }
        | CONTINUE ';'                        { $$ = opr(CONTINUE, 0); }
        ;

vari:
          VARIABLE { $$ = id($1); }
        ;


stmt_list:
          stmt                  { $$ = $1; }
        | stmt_list stmt        { $$ = opr(';', 2, $1, $2); }
        ;

allexpr:
	  expr			{ $$ = $1; }
	| STRING		{ $$ = strCon($1); }
	;

expr:
          INTEGER               { $$ = con($1); }
        | vari                  { $$ = $1; }
        | '-' expr %prec UMINUS { $$ = opr(UMINUS, 1, $2); }
        | expr '+' expr         { $$ = opr('+', 2, $1, $3); }
        | expr '-' expr         { $$ = opr('-', 2, $1, $3); }
        | expr '*' expr         { $$ = opr('*', 2, $1, $3); }
        | expr '%' expr         { $$ = opr('%', 2, $1, $3); }
        | expr '/' expr         { $$ = opr('/', 2, $1, $3); }
        | expr '<' expr         { $$ = opr('<', 2, $1, $3); }
        | expr '>' expr         { $$ = opr('>', 2, $1, $3); }
        | expr GE expr          { $$ = opr(GE, 2, $1, $3); }
        | expr LE expr          { $$ = opr(LE, 2, $1, $3); }
        | expr NE expr          { $$ = opr(NE, 2, $1, $3); }
        | expr EQ expr          { $$ = opr(EQ, 2, $1, $3); }
        | expr AND expr         { $$ = opr(AND, 2, $1, $3); }
        | expr OR expr          { $$ = opr(OR, 2, $1, $3); }
        | '(' expr ')'          { $$ = $2; }
        ;

%%

#define SIZEOF_NODETYPE ((char *)&p->con - (char *)p)

nodeType *con(int value) {
    nodeType *p;
    size_t nodeSize;

    /* allocate node */
    nodeSize = SIZEOF_NODETYPE + sizeof(conNodeType);
    if ((p = malloc(nodeSize)) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeCon;
    p->con.value = value;

    return p;
}

nodeType *strCon(char *value) {
    nodeType *p;
    size_t nodeSize;

    /* allocate node */
    nodeSize = SIZEOF_NODETYPE + sizeof(conNodeType);
    if ((p = malloc(nodeSize)) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeStrCon;
    p->strCon.value = value;

    return p;
}

nodeType *id(int i) {
    nodeType *p;
    size_t nodeSize;

    /* allocate node */
    nodeSize = SIZEOF_NODETYPE + sizeof(idNodeType);
    if ((p = malloc(nodeSize)) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeId;
    p->id.i = i;

    return p;
}

nodeType *opr(int oper, int nops, ...) {
    va_list ap;
    nodeType *p;
    size_t nodeSize;
    int i;

    /* allocate node */
    nodeSize = SIZEOF_NODETYPE + sizeof(oprNodeType) +
        (nops - 1) * sizeof(nodeType*);
    if ((p = malloc(nodeSize)) == NULL)
        yyerror("out of memory");

    /* copy information */
    p->type = typeOpr;
    p->opr.oper = oper;
    p->opr.nops = nops;
    va_start(ap, nops);
    for (i = 0; i < nops; i++)
        p->opr.op[i] = va_arg(ap, nodeType*);
    va_end(ap);
    return p;
}

void freeNode(nodeType *p) {
    int i;

    if (!p) return;
    if (p->type == typeOpr) {
        for (i = 0; i < p->opr.nops; i++)
            freeNode(p->opr.op[i]);
    }
    free (p);
}

void yyerror(char *s) {
    fprintf(stdout, "%s\n", s);
}

int main(int argc, char **argv) {
extern FILE* yyin;
    yyin = fopen(argv[1], "r");
    yyparse();
    return 0;
}
