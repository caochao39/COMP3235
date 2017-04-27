%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "calc3.h"


/* prototypes */
nodeType *createFunc(nodeType * funcNameId, nodeType *args, nodeType *stmtlist, int coun);
nodeType *opr(int oper, int nops, ...);
nodeType *id(char *var_name);
nodeType *con(int value);
nodeType *charCon(char *value);
nodeType *strCon(char *value);
nodeType* addOperand(nodeType* p1,nodeType* p2);
void freeNode(nodeType *p);
int ex(nodeType *p, int, int, int);
void eop();
int yylex(void);

void yyerror(char *s);

// variable related
char* sym[200]; //symbol table
int var_count = 0; //variable count

int inSYM(char *var_name);
void insertSYM(char *var_name);
int getSYMIdx(char *var_name);
void emptySYM();
void printsp();

// function related
char* func[200]; //function table
int func_count = 0; //function count

void insertFUNC(char *var_name);
int getFUNCIdx(char *var_name);
void emptyFUNC();


// variable type related
int vType[200]; //type table

// expression type checking
int checkExprType (nodeType* p);

int argc = 0; // global variable for arguments count
void prepass(nodeType *p, int infunc);
%}

%union {
    int iValue;                 /* integer value */
    char *sValue;		/* address of the string */
    char *vName;                /* symbol table index */
    nodeType *nPtr;             /* node pointer */
};

%token <iValue> INTEGER 
%token <sValue> STRING CHARACTER
%token <vName> VARIABLE 
%token FOR WHILE IF PRINT READ BREAK CONTINUE RETURN
%nonassoc IFX
%nonassoc ELSE

%left AND OR

%left GE LE EQ NE '>' '<'
%left '+' '-'
%left '*' '/' '%'
%nonassoc UMINUS

%type <nPtr> stmt allexpr expr stmt_list vari function tree args

%%

program:
        tree                { prepass($1, 0); printsp(); ex($1, 998, 998, 0); exit(0); }
        ;

tree:
	  tree stmt		{ $$ = opr(MAIN, 2, $1, $2); }
        | tree function         { $$ = opr(MAIN, 2, $1, $2); }
        | /* NULL */		{ $$ = NULL; } 
        ;

function:
	vari '(' args ')' '{' stmt_list '}' 	{ $$ = createFunc($1, $3, $6, argc); argc = 0; }  // function definition
	| vari '(' ')' '{' stmt_list '}' 	{ $$ = createFunc($1, NULL, $5, 0); argc = 0; } 
	;

args:     args ',' vari			      { argc++; $$ = addOperand($1, $3); }
	| vari				      { argc++; $$ = $1; }	
	| /* NULL */	
	;

stmt:
          ';'                                 { $$ = opr(';', 2, NULL, NULL); }
        | allexpr ';'                         { $$ = $1; }
        | PRINT allexpr ';'                   { $$ = opr(PRINT, 1, $2); }
        | READ vari ';'                       { $$ = opr(READ, 1, $2); }
        | vari '=' allexpr ';'                { $$ = opr('=', 2, $1, $3); }
	| vari '(' args ')' ';'		      { $$ = opr(CALL, 2, $1, $3); } // function call
        | FOR '(' stmt stmt stmt ')' stmt     { $$ = opr(FOR, 4, $3, $4, $5, $7); }
        | WHILE '(' allexpr ')' stmt          { $$ = opr(WHILE, 2, $3, $5); }
        | IF '(' allexpr ')' stmt %prec IFX   { $$ = opr(IF, 2, $3, $5); }
        | IF '(' allexpr ')' stmt ELSE stmt   { $$ = opr(IF, 3, $3, $5, $7); }
        | '{' stmt_list '}'                   { $$ = $2; }
        | BREAK ';'                           { $$ = opr(BREAK, 0); }
        | CONTINUE ';'                        { $$ = opr(CONTINUE, 0); }
        ;

vari:
          VARIABLE { $$ = id($1); }
	| '@' VARIABLE { $$ = opr('@', 1, id($2)); }
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
	  
          vari                  { $$ = $1; }
        | INTEGER               { $$ = con($1); }
	| CHARACTER		{ $$ = charCon($1); }
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

nodeType *charCon(char *value) {
    nodeType *p;
    size_t nodeSize;

    /* allocate node */
    nodeSize = SIZEOF_NODETYPE + sizeof(conNodeType);
    if ((p = malloc(nodeSize)) == NULL)
        yyerror("out of memory");
    /* copy information */
    p->type = typeCharCon;
    p->charCon.value = value;

    return p;
}

// add p2 to p1
nodeType* addOperand(nodeType* p1,nodeType* p2){
    nodeType* p;
    size_t nodeSize;
    int i;
    /* allocate node */
    nodeSize = SIZEOF_NODETYPE + sizeof(oprNodeType) +
        (p1->opr.nops) * sizeof(nodeType*);
    if ((p = malloc(nodeSize)) == NULL)
        yyerror("out of memory");
    // copy values
    p->type = typeOpr;
    p->opr.oper = p1->opr.oper;
    p->opr.nops = p1->opr.nops +1;
    for (i=0;i<p1->opr.nops;i++)
        p->opr.op[i] = p1->opr.op[i];
    p->opr.op[i] = p2;
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

nodeType *id(char *name) {
    nodeType *p;
    size_t nodeSize;

    /* allocate node */
    nodeSize = SIZEOF_NODETYPE + sizeof(idNodeType);
    if ((p = malloc(nodeSize)) == NULL)
        yyerror("out of memory");

    p->id.var_name = name;
    p->type = typeId;

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

/* 
funcNameId: function name id node
arguments: function arguments
stmtlist: content of the function
coun: argc
function for creating node for funtion
*/
nodeType *createFunc(nodeType* funcNameId, nodeType *arguments, nodeType *stmtlist, int coun) {
    nodeType *p;
    size_t nodeSize;
    /* allocate node */
    nodeSize = SIZEOF_NODETYPE + sizeof(funcNodeType);
    if ((p = malloc(nodeSize)) == NULL)
        yyerror("out of memory");
    /* copy information */
    p->func.argc = coun;
    p->func.args = arguments;
    p->func.name = funcNameId->id.var_name;
    p->func.op = stmtlist;
    p->type = typeFunc;

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
