%{
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include "calc3.h"

#define TABLE_SIZE 40000

/* prototypes */
nodeType *createFunc(nodeType * funcNameId, nodeType *args, nodeType *stmtlist, int coun);
nodeType *opr(int oper, int nops, ...);
nodeType *id(char *var_name, int isGlobal);
nodeType *con(int value);
nodeType *charCon(char *value);
nodeType *strCon(char *value);
nodeType* addOperand(nodeType* p1,nodeType* p2);
nodeType * OneDArray(nodeType * name, nodeType * index);
nodeType * TwoDArray(nodeType * name, nodeType * fst_index, nodeType * scd_index);
nodeType * ThreeDArray(nodeType * name, nodeType * fst_index, nodeType * scd_index, nodeType * thd_index);
void freeNode(nodeType *p);
int ex(nodeType *p, int, int, int);
void eop();
int yylex(void);

void yyerror(char *s);

// variable related
char* sym[TABLE_SIZE]; //symbol table
int var_count = 0; //variable count
int loc_var_count = 0;//count for local variable


int inSYM(char *var_name);
void insertSYM(char * var_name, int isGlobal);
int getSYMIdx(char *var_name, int isGlobal);
void emptySYM(int isGlobal);
void printsp(int coun);
void prepass(nodeType *p, int infunc);
void printStackTop(int type);
void insertArraySYM(char * array_name, int array_size, int is_global);
int checkType (int index);
void insertFUNC(char * func_name);
int getFUNCIdx(char * func_name);
void emptyFUNC();
void insertArg(int argnum, int idx);
void setType (int index, int t);
int checkExprType (nodeType* p);

//helper functions
void printSYM();
// function related
char* func[TABLE_SIZE]; //function table
int func_count = 0; //function count
int argTable[TABLE_SIZE];

void insertFUNC(char *var_name);
int getFUNCIdx(char *var_name);
void emptyFUNC();

void insertArg(int argnum, int idx);
// variable type related
int vType[TABLE_SIZE]; //type table

// expression type checking
int checkExprType (nodeType* p);

int argc = 0; // global variable for arguments count

int in_func = 0; // global variable for checking if variables are declared inside functions


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
%token FOR WHILE IF BREAK CONTINUE RETURN
%token PUTI PUTC PUTS PUTI_ PUTC_ PUTS_ GETI GETC GETS
%token ARRAY ARRAY_DECLARE PARAM_ARRAY_DECLARE
%token STRING_ARRAY_DECLARE
%nonassoc IFX
%nonassoc ELSE

%left AND OR

%left GE LE EQ NE '>' '<'
%left '+' '-'
%left '*' '/' '%'
%nonassoc UMINUS

%type <nPtr> stmt expr stmt_list vari function tree para

%%

program:
        tree                { emptySYM(1); prepass($1, 0); printsp(var_count); printSYM(); ex($1, 998, 998, 0); eop(); exit(0); }
        ;

tree:
	  tree stmt		{ $$ = opr(MAIN, 2, $1, $2); in_func = 0; }
    | tree function         { $$ = opr(MAIN, 2, $1, $2); }
    | /* NULL */		{ $$ = NULL; }
    ;

function:
	vari '(' para ')' '{' stmt_list '}' 	{ $$ = createFunc($1, $3, $6, argc); in_func = 1;}  // function definition
	| vari '(' ')' '{' stmt_list '}' 	{ $$ = createFunc($1, NULL, $5, 0); in_func = 1;}
	;

para:   expr				      	{ $$ = $1; }
  | ARRAY vari '[' INTEGER ']' '[' INTEGER ']' { $$ = opr(PARAM_ARRAY_DECLARE, 3, $2, con($4), con($7));}
  | ARRAY vari '[' INTEGER ']' '[' INTEGER ']' '[' INTEGER ']' { $$ = opr(PARAM_ARRAY_DECLARE, 4, $2, con($4), con($7), con($10));}
	| expr ',' para		      	{ $$ = opr(',', 2, $1, $3); }
	;

stmt:
          ';'                                 { $$ = opr(';', 2, NULL, NULL); }
        | vari '=' expr ';'                   { $$ = opr('=', 2, $1, $3); }
        | FOR '(' stmt stmt stmt ')' stmt     { $$ = opr(FOR, 4, $3, $4, $5, $7); }
        | WHILE '(' expr ')' stmt             { $$ = opr(WHILE, 2, $3, $5); }
        | IF '(' expr ')' stmt %prec IFX      { $$ = opr(IF, 2, $3, $5); }
        | IF '(' expr ')' stmt ELSE stmt      { $$ = opr(IF, 3, $3, $5, $7); }
        | '{' stmt_list '}'                   { $$ = $2; }
        | BREAK ';'                           { $$ = opr(BREAK, 0); }
        | CONTINUE ';'                        { $$ = opr(CONTINUE, 0); }
        | GETI '(' vari ')' ';'               { $$ = opr(GETI, 1, $3);}
        | PUTI '(' expr ')' ';'               { $$ = opr(PUTI, 1, $3);}
        | PUTI_ '(' expr ')' ';'              { $$ = opr(PUTI_, 1, $3);}
        | GETC '(' vari ')' ';'               { $$ = opr(GETC, 1, $3);}
        | PUTC '(' expr ')' ';'               { $$ = opr(PUTC, 1, $3);}
        | PUTC_ '(' expr ')' ';'              { $$ = opr(PUTC_, 1, $3);}
        | GETS '(' vari ')' ';'               { $$ = opr(GETS, 1, $3);}
        | PUTS '(' expr ')' ';'               { $$ = opr(PUTS, 1, $3);}
        | PUTS_ '(' expr ')' ';'              { $$ = opr(PUTS_, 1, $3);}
        | RETURN expr ';'                     { $$ = opr(RETURN,1,$2);}
        | expr ';'                            { $$ = $1; }
        | ARRAY vari '[' INTEGER ']' ';'      { $$ = opr(ARRAY_DECLARE, 2, $2, con($4));}
        | ARRAY vari '[' INTEGER ']' '[' INTEGER ']' ';' { $$ = opr(ARRAY_DECLARE, 3, $2, con($4), con($7));}
        | ARRAY vari '[' INTEGER ']' '[' INTEGER ']' '[' INTEGER ']' ';' { $$ = opr(ARRAY_DECLARE, 4, $2, con($4), con($7), con($10));}
        | vari '[' expr ']' '=' expr ';'      { $$ = opr('=', 3, $1, $3, $6);}
        | vari '[' expr ']' '[' expr ']' '=' expr ';' { $$ = opr('=', 4, $1, $3, $6, $9); }
        | vari '[' expr ']' '[' expr ']' '[' expr ']' '=' expr ';' { $$ = opr('=', 5, $1, $3, $6, $9, $12); }
        | ARRAY vari '[' INTEGER ']' '=' STRING ';'      { $$ = opr(STRING_ARRAY_DECLARE, 3, $2, con($4), strCon($7)); }
        ;

vari:
          VARIABLE { $$ = id($1, 0); }
	      | '@' VARIABLE { $$ = id($2, 1); }
        ;


stmt_list:
          stmt                  { $$ = $1; }
        | stmt_list stmt        { $$ = opr(';', 2, $1, $2); }
        ;

expr:
          INTEGER               { $$ = con($1); }
	      | CHARACTER		{ $$ = charCon($1); }
	      | STRING		{ $$ = strCon($1); }
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
	      | vari '(' para ')'     { $$ = opr(CALL, 2, $1, $3); } // function call
	      | vari '(' ')'     	{ $$ = opr(CALL, 2, $1, NULL); } // function call
	      | vari                  { $$ = $1; }
        | vari '[' expr ']'     { $$ = OneDArray($1, $3);}
        | vari '[' expr ']' '[' expr ']'     { $$ = TwoDArray($1, $3, $6);}
        | vari '[' expr ']' '[' expr ']' '[' expr ']'    { $$ = ThreeDArray($1, $3, $6, $9);}
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
    p->strCon.value = (char *)malloc(sizeof(char) * 200);
    int i=0;
    while(value[i]!='\0'){
        p->strCon.value[i] = value[i];
        i++;
    }
    p->type = typeStrCon;
    //p->strCon.value = value;

    return p;
}

nodeType *id(char *name, int isGlobal) {
    nodeType *p;
    size_t nodeSize;

    /* allocate node */
    nodeSize = SIZEOF_NODETYPE + sizeof(idNodeType);
    if ((p = malloc(nodeSize)) == NULL)
        yyerror("out of memory");

    p->id.isGlobal = isGlobal;
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
    p->func.argc = countArgc(arguments);
    p->func.args = arguments;
    p->func.name = funcNameId->id.var_name;
    p->func.op = stmtlist;
    p->type = typeFunc;

    //printf("name:%s, argc: %d\n", funcNameId->id.var_name, p->func.argc);
    return p;
}

int countArgc(nodeType *arguments){
    if (arguments!=NULL){
      if (arguments->type == typeOpr && arguments->opr.oper == ','){
        return 1+countArgc(arguments->opr.op[1]);
      } else {
        return 1;
      }
    }else{
      return 0;
    }
}

/* OneD Array construction function*/
nodeType * OneDArray(nodeType * name, nodeType * index)
{
  nodeType *p;
  size_t nodeSize;
  /* allocate node*/
  nodeSize = SIZEOF_NODETYPE + sizeof(OneDArrayNodeType);
  if((p = malloc(nodeSize)) == NULL)
  {
    yyerror("out of memory");
  }
  /* copy information */
  p->type = typeOneDArray;
  p->onedarray.name = name;
  p->onedarray.index = index;

  return p;
}

/* TwoD Array construction function*/
nodeType * TwoDArray(nodeType * name, nodeType * fst_index, nodeType * scd_index)
{
  nodeType *p;
  size_t nodeSize;
  /* allocate node*/
  nodeSize = SIZEOF_NODETYPE + sizeof(TwoDArrayNodeType);
  if((p = malloc(nodeSize)) == NULL)
  {
    yyerror("out of memory");
  }
  /* copy information */
  p->type = typeTwoDArray;
  p->twodarray.name = name;
  p->twodarray.fst_index = fst_index;
  p->twodarray.scd_index = scd_index;

  return p;
}

/* Three D Array construction function*/
nodeType * ThreeDArray(nodeType * name, nodeType * fst_index, nodeType * scd_index, nodeType * thd_index)
{
  nodeType *p;
  size_t nodeSize;
  /* allocate node*/
  nodeSize = SIZEOF_NODETYPE + sizeof(ThreeDArrayNodeType);
  if((p = malloc(nodeSize)) == NULL)
  {
    yyerror("out of memory");
  }
  /* copy information */
  p->type = typeThreeDArray;
  p->threedarray.name = name;
  p->threedarray.fst_index = fst_index;
  p->threedarray.scd_index = scd_index;
  p->threedarray.thd_index = thd_index;
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
