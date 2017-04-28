#include <stdio.h>
#include "calc3.h"
#include "y.tab.h"

extern int var_count, func_count, loc_var_count;
extern int vType[200];
extern char* func[200];

/*
function to let nas know the number of global variables
*/
void printsp(){
    printf("\tpush\tsp\n"); 
    printf("\tpush\t%d\n", var_count); 
    printf("\tadd\n"); 
    printf("\tpop\tsp\n"); 
}

/* prepass the whole tree */
void prepass(nodeType *p, int infunc){
    if (!p) return;
    switch(p->type) {
	case typeFunc:
	    insertFUNC(p->func.name);
	    prepass(p->func.args, 1);
	    prepass(p->func.op, 1);
	    break;
	case typeId:
	    if (infunc == 0){
	      p->id.isGlobal=1;
 	    }
	    insertSYM(p->id.var_name, p->id.isGlobal);
	    break;
	case typeOpr:
            switch(p->opr.oper) {
		case FOR:
		    prepass(p->opr.op[0], infunc);
		    prepass(p->opr.op[1], infunc);
		    prepass(p->opr.op[3], infunc);
		    prepass(p->opr.op[2], infunc);
		    break;
		case WHILE:
		    prepass(p->opr.op[1], infunc);
		    break;
		case IF:
		    if (p->opr.nops > 2) {
		    /* if else then */
			prepass(p->opr.op[1], infunc);
			prepass(p->opr.op[2], infunc);
		    } else {
		    /* if else */
			prepass(p->opr.op[1], infunc);
		    }
		    break;
		case '=':
		    if(p->opr.op[0]->type == typeId) {
		    	/* insert into symbol table */
			if (infunc == 0){
			    p->opr.op[0]->id.isGlobal=1;
 			}
    		    	insertSYM(p->opr.op[0]->id.var_name, p->opr.op[0]->id.isGlobal);
		    }else if(p->opr.op[0]->type == typeOpr && p->opr.op[0]->opr.oper == '@'){
			prepass(p->opr.op[0], infunc);
		    }
		    break;
		case '@':
		    if(p->opr.op[0]->type == typeId && infunc == 1) {
		    	/* insert into symbol table */
    		    	insertSYM(p->opr.op[0]->id.var_name, 1);
		    }else{
			yyerror("Wrong @ usage!");
			exit(0);
		    }
		case GETI:
		    if(p->opr.op[0]->type == typeId) {
		 	prepass(p->opr.op[0], infunc);
   		    } else if(p->opr.op[0]->type == typeOpr && p->opr.op[0]->opr.oper == '@'){
			prepass(p->opr.op[0], infunc);
		    }
		case GETS:
		    if(p->opr.op[0]->type == typeId) {
		 	prepass(p->opr.op[0], infunc);
   		    } else if(p->opr.op[0]->type == typeOpr && p->opr.op[0]->opr.oper == '@'){
			prepass(p->opr.op[0], infunc);
		    }
		case GETC:
		    if(p->opr.op[0]->type == typeId) {
		 	prepass(p->opr.op[0], infunc);
   		    } else if(p->opr.op[0]->type == typeOpr && p->opr.op[0]->opr.oper == '@'){
			prepass(p->opr.op[0], infunc);
		    }
		default:
            	    prepass(p->opr.op[0], infunc);
            	    prepass(p->opr.op[1], infunc);
		    break;
	    }
	default:
	    break;
    }
}

/*
function to deal with printing for different type
*/
void printStackTop(int type){
    
    if(type == 1){
        printf("\tputi\n");
    }else if(type == 2){
        printf("\tputs\n");
    }else if(type == 3){
        printf("\tputc\n");
    }else{
        // unknown type
	yyerror("unknown type for printing");
    }
}

/*
function for checking existance of a variable in the symbol table
  var_name: variable name
*/
int inSYM(char * var_name)
{
  int i;
  for(i = 0; i < var_count; i++)
  {
    if(strcmp(sym[i], var_name) == 0)
    {
      return 1; // in sym
    }
  }
  return 0; // not in sym
}

/*
function for adding variables to symbol table
  var_name: variable name
*/
void insertSYM(char * var_name, int isGlobal)
{
  if(var_count >= 200)
  {
    printf("\tNumber of variables exceeds the limit!\n");
    return;
  }
  if(getSYMIdx(var_name, isGlobal) < 0)//not in sym
  {
    if(isGlobal == 1){ //global variable
      sym[var_count] = (char *) malloc (strlen(var_name));
      strcpy(sym[var_count], var_name);
      var_count ++;
    } else {
      sym[loc_var_count+100] = (char *) malloc (strlen(var_name));
      strcpy(sym[loc_var_count+100], var_name);
      loc_var_count ++;
    }
  }
  else
  {
    // do nothing
    //printf("\tError: variable -%s- already declared!\n", var_name);
  }
}

/*
function for getting index of a variable in sym
*/
int getSYMIdx(char * var_name, int isGlobal)
{
  int i;
  if (isGlobal == 1){ // for global variable
  for(i = 0; i < var_count; i++)
  {
    if(strcmp(sym[i], var_name) == 0)
    {
      return i;
    }
  }
  }else{ // for local variable
  for(i = 100; i < 100 + loc_var_count; i++)
  {
    if(strcmp(sym[i], var_name) == 0)
    {
      return i;
    }
  }
  }
  return -1; // not found
}

/*
function for clearing the symbol table
*/
void emptySYM(int isGlobal)
{
  int i;
  if(isGlobal){
  for(i = 0; i < var_count; i++)
    {
      free(sym[i]);
    }
    var_count = 0;
  }
  else{
    for(i = 100; i < 100 + loc_var_count; i++)
    {
      free(sym[i]);
    }
    loc_var_count = 0;
  }
}

/*
function to get type for stored variable
*/
int checkType (int index)
{
    return vType[index];
}

/*
function for adding functions to func table
  func_name: function name
*/
void insertFUNC(char * func_name)
{
  if(func_count >= 200)
  {
    printf("\tNumber of variables exceeds the limit!\n");
    return;
  }
  
  if(getFUNCIdx(func_name) < 0)//not in sym
  {
    func[func_count] = (char *) malloc (strlen(func_name));
    strcpy(func[func_count], func_name);
    func_count ++;
  }
  else
  {
    // the function has already been defined
    yyerror("\tFunction has already been defined!\n");
    exit(0);
  }
}

/*
function for getting index of a function in func
*/
int getFUNCIdx(char * func_name)
{
  int i;
  for(i = 0; i < func_count; i++)
  {
    if(strcmp(func[i], func_name) == 0)
    {
      return i;
    }
  }
  return -1; // not found
}

/*
function for clearing the function table
*/
void emptyFUNC()
{
  int i;
  for(i = 0; i < func_count; i++)
  {
    free(func[i]);
  }
  func_count = 0;
}


/*
function to set type for some variable
*/
void setType (int index, int t)
{
    vType[index] = t;
    return;
}

/*
function for checking type for an expression
*/
int checkExprType (nodeType* p){
    switch(p->type) {
        case typeId:{
            char *str = p->id.var_name;
            int index = getSYMIdx(str, p->id.isGlobal);
            int type = checkType(index);
            return type;
	}   
        case typeCon:
            return 1;
        case typeStrCon:
            return 2;
        case typeCharCon: 
            return 3;
        case typeOpr:
            switch(p->opr.oper) {
                case UMINUS:
                    return 1;
                default:
                    return 1;
            }
    }
}

static int lbl;
int ex(nodeType *p, int blbl, int clbl, int infunc) {
    int lblx, lbly, lblz;

    if (!p) return 0;
    switch(p->type) {
    case typeCon:
        printf("\tpush\t%d\n", p->con.value); 
        break;
    case typeCharCon:
	printf("\tpush\t%s\n", p->charCon.value);
        break;
    case typeStrCon:
	printf("\tpush\t\"%s\"\n", p->strCon.value);
        break;
    case typeId:{
        char *str = p->id.var_name;
        int index = getSYMIdx(str, p->id.isGlobal);
        if (index==-1)
        {
            printf("\tError: Variable \"%s\" uninitialized\n", str);
            exit(0);
        }
	if (p->id.isGlobal == 1)
	  printf("\tpush\tsb[%d]\n", index);
	else 
	  printf("\tpush\tfp[%d]\n", index - 100);
        break;
    }
    case typeFunc:
	printf("L%03d:", 500 + getFUNCIdx(p->func.name));
	prepass(p->func.args, 1);
	prepass(p->func.op, 1);
	ex(p->func.op, blbl, clbl, 1);
	break;
    case typeOpr:
        switch(p->opr.oper) {
	case RETURN:
	    ex(p->opr.op[0], -1, -1, infunc);
            printf("\tret\n");
 	    emptySYM(0);
	    break;
        case BREAK:
            printf("\tjmp\tL%03d\n", blbl);
            break;
        case CONTINUE:
            printf("\tjmp\tL%03d\n", clbl);
            break;
        case FOR:
            lblx = lbl++;
            lbly = lbl++;
            lblz = lbl++;
            ex(p->opr.op[0], blbl, clbl, infunc);
            printf("L%03d:\n", lblx);
            ex(p->opr.op[1], blbl, clbl, infunc);
            printf("\tj0\tL%03d\n", lbly);
            ex(p->opr.op[3], lbly, lblz, infunc);
            printf("L%03d:\n", lblz);
            ex(p->opr.op[2], blbl, clbl, infunc);
            printf("\tjmp\tL%03d\n", lblx);
            printf("L%03d:\n", lbly);
            break;
        case WHILE:
            lblx = lbl++;
            lbly = lbl++;
            printf("L%03d:\n", lblx);
            ex(p->opr.op[0], blbl, clbl, infunc);
            printf("\tj0\tL%03d\n", lbly);
            ex(p->opr.op[1], lbly, lblx, infunc);
            printf("\tjmp\tL%03d\n", lblx);
            printf("L%03d:\n", lbly);
            break;
        case IF:
            ex(p->opr.op[0], blbl, clbl, infunc);
            if (p->opr.nops > 2) {
                /* if else */
                printf("\tj0\tL%03d\n", lblx = lbl++);
                ex(p->opr.op[1], blbl, clbl, infunc);
                printf("\tjmp\tL%03d\n", lbly = lbl++);
                printf("L%03d:\n", lblx);
                ex(p->opr.op[2], blbl, clbl, infunc);
                printf("L%03d:\n", lbly);
            } else {
                /* if */
                printf("\tj0\tL%03d\n", lblx = lbl++);
                ex(p->opr.op[1], blbl, clbl, infunc);
                printf("L%03d:\n", lblx);
            }
            break;
	case '@':
	    ex(p->opr.op[0], blbl, clbl, infunc);
	    break;
        case '=':
            ex(p->opr.op[1], blbl, clbl, infunc);
	    if(p->opr.op[0]->type == typeId) {
		/* examine type */
                int ind = getSYMIdx(p->opr.op[0]->id.var_name, p->opr.op[0]->id.isGlobal);
		int thisT = checkExprType(p->opr.op[1]);
		setType(ind, thisT);
		if (ind == -1) 
		    insertSYM(p->opr.op[0]->id.var_name, p->opr.op[0]->id.isGlobal);
  		if (p->opr.op[0]->id.isGlobal)// for global
		  printf("\tpop\tsb[%d]\n", getSYMIdx(p->opr.op[0]->id.var_name, p->opr.op[0]->id.isGlobal)); 
  		else // for local
		  printf("\tpop\tfp[%d]\n", getSYMIdx(p->opr.op[0]->id.var_name, p->opr.op[0]->id.isGlobal)-100); 

	    } else if (p->opr.op[0]->type == typeOpr && p->opr.op[0]->opr.oper == '@') { /* @ for global variable */
		nodeType* tmp = p->opr.op[0]->opr.op[0];
		int ind = getSYMIdx(tmp->id.var_name, tmp->id.isGlobal);
		int thisT = checkExprType(p->opr.op[1]);
		setType(ind, thisT);
		
  		if (tmp->id.isGlobal)// for global
		  printf("\tpop\tsb[%d]\n", getSYMIdx(tmp->id.var_name, tmp->id.isGlobal)); 
	    }
            break;
        case UMINUS:
            ex(p->opr.op[0], blbl, clbl, infunc);
            printf("\tneg\n");
            break;
	case PUTI:
	    {
	    int typeP = checkExprType(p->opr.op[0]);
	    //if(typeP==1){
		ex(p->opr.op[0],blbl, clbl, infunc);
	    	printf("\tputi\n");		
	    //}else{
		//yyerror("PUTI can not be used for non-integer type.\n");
	    //}
	    }
            break;
	case PUTI_:
	    {
	    int typeP = checkExprType(p->opr.op[0]);
	    //if(typeP==1){
		ex(p->opr.op[0],blbl, clbl, infunc);
	    	printf("\tputi_\n");		
	    //}else{
		//yyerror("PUTI_ can not be used for non-integer type.\n");
	    //}
	    }
            break;
	case PUTC:
	    {
	    int typeP = checkExprType(p->opr.op[0]);
	    //if(typeP==3){
		ex(p->opr.op[0],blbl,clbl, infunc);
	    	printf("\tputc\n");		
	    //}else{
		//yyerror("PUTC can not be used for non-character type.\n");
	    //}
	    }
	    break;
	case PUTC_:
	    {
	    int typeP = checkExprType(p->opr.op[0]);
	    //if(typeP==3){
		ex(p->opr.op[0],blbl,clbl, infunc);
	    	printf("\tputc_\n");		
	    //}else{
		yyerror("PUTC_ can not be used for non-character type.\n");
	    //}
	    }
	    break;
	case PUTS:
	    {
	    int typeP = checkExprType(p->opr.op[0]);
	    //if(typeP==2){
		ex(p->opr.op[0],blbl,clbl, infunc);
	    	printf("\tputs\n");		
	    //}else{
		//yyerror("PUTS can not be used for non-string type.");
	    //}
	    }
    	    break;
	case PUTS_:
	    {
	    int typeP = checkExprType(p->opr.op[0]);
	    //if(typeP==2){
		ex(p->opr.op[0],blbl,clbl, infunc);
	    	printf("\tputs_\n");		
	    //}else{
		//yyerror("PUTS_ can not be used for non-string type.\n");
	    //}
	    }
	    break;
	case GETI:
	    {
	    nodeType* tmp;
	    if(p->opr.op[0]->type == typeId) {
		tmp = p->opr.op[0];
	    } else if (p->opr.op[0]->type == typeOpr){
		tmp = p->opr.op[0]->opr.op[0];
	    } else {
		yyerror("error.\n");
	    }
	    int ind = getSYMIdx(tmp->id.var_name, tmp->id.isGlobal);
	    setType(ind, 1);
	    printf("\tgeti\n");
	    if (tmp->id.isGlobal)
	      	printf("\tpop\tsb[%d]\n", getSYMIdx(tmp->id.var_name, tmp->id.isGlobal)); 
	    else
		printf("\tpop\tfp[%d]\n", getSYMIdx(tmp->id.var_name, tmp->id.isGlobal)-100); 
            break;
	    }
	case GETC:
	    {
	    nodeType* tmp;
	    if(p->opr.op[0]->type == typeId) {
		tmp = p->opr.op[0];
	    } else if (p->opr.op[0]->type == typeOpr){
		tmp = p->opr.op[0]->opr.op[0];
	    } else {
		yyerror("error.\n");
	    }
	    int ind = getSYMIdx(tmp->id.var_name, tmp->id.isGlobal);
	    setType(ind, 3);
	    printf("\tgetc\n");
	    if (tmp->id.isGlobal)
	      	printf("\tpop\tsb[%d]\n", getSYMIdx(tmp->id.var_name, tmp->id.isGlobal)); 
	    else
		printf("\tpop\tfp[%d]\n", getSYMIdx(tmp->id.var_name, tmp->id.isGlobal)-100); 
            break;
	    }
	case GETS:
	    {
	    nodeType* tmp;
	    if(p->opr.op[0]->type == typeId) {
		tmp = p->opr.op[0];
	    } else if (p->opr.op[0]->type == typeOpr){
		tmp = p->opr.op[0]->opr.op[0];
	    } else {
		yyerror("error.\n");
	    }
	    int ind = getSYMIdx(tmp->id.var_name, tmp->id.isGlobal);
	    setType(ind, 2);
	    printf("\tgets\n");
	    if (tmp->id.isGlobal)
	      	printf("\tpop\tsb[%d]\n", getSYMIdx(tmp->id.var_name, tmp->id.isGlobal)); 
	    else
		printf("\tpop\tfp[%d]\n", getSYMIdx(tmp->id.var_name, tmp->id.isGlobal)-100);  
            break;
	    }
        default:
            ex(p->opr.op[0], blbl, clbl, infunc);
            ex(p->opr.op[1], blbl, clbl, infunc);
            switch(p->opr.oper) {
                case '+':   printf("\tadd\n"); break;
                case '-':   printf("\tsub\n"); break;
                case '*':   printf("\tmul\n"); break;
                case '/':   printf("\tdiv\n"); break;
                case '%':   printf("\tmod\n"); break;
                case '<':   printf("\tcompLT\n"); break;
                case '>':   printf("\tcompGT\n"); break;
                case GE:    printf("\tcompGE\n"); break;
                case LE:    printf("\tcompLE\n"); break;
                case NE:    printf("\tcompNE\n"); break;
                case EQ:    printf("\tcompEQ\n"); break;
                case AND:   printf("\tand\n"); break;
                case OR:    printf("\tor\n"); break;
            }
        }
    }

    return 0;
}

void eop() {
    // add end of program label
    printf("\tjmp\tL999\n");
    printf("L998:\n");
    printf("\tpush\t999999\n");
    printf("\tputi\n");
    printf("L999:\n");
}
