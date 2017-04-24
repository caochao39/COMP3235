#include <stdio.h>
#include "calc3.h"
#include "y.tab.h"

static int lbl;
int ex(nodeType *p, int blbl, int clbl) {
    int lblx, lbly, lblz;

    if (!p) return 0;
    switch(p->type) {
    case typeCon:
        printf("\tpush\t%d\n", p->con.value);
        break;
    case typeId:
        printf("\tpush\t%c\n", p->id.i + 'a');
        break;
    case typeOpr:
        switch(p->opr.oper) {
        case RVALUE:
            printf("\tpushi\t%c\n",  ex(p->opr.op[0], blbl, clbl)+'a');
            break;
        case OFFSET:
            ex(p->opr.op[1], blbl, clbl);
            printf("\tpush\t%d\n", p->opr.op[0]->id.i);
            printf("\tadd\n");
            printf("\tpush\t0\n");
            printf("\tcompGE\n");
            printf("\tjz\tL998\n");

            ex(p->opr.op[1], blbl, clbl);
            printf("\tpush\t%d\n", p->opr.op[0]->id.i);
            printf("\tadd\n");
            printf("\tpush\t26\n");
            printf("\tcompLT\n");
            printf("\tjz\tL998\n");

            ex(p->opr.op[1], blbl, clbl);
            return(p->opr.op[0]->id.i);
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
            ex(p->opr.op[0], blbl, clbl);
            printf("L%03d:\n", lblx);
            ex(p->opr.op[1], blbl, clbl);
            printf("\tjz\tL%03d\n", lbly);
            ex(p->opr.op[3], lbly, lblz);
            printf("L%03d:\n", lblz);
            ex(p->opr.op[2], blbl, clbl);
            printf("\tjmp\tL%03d\n", lblx);
            printf("L%03d:\n", lbly);
            break;
        case WHILE:
            lblx = lbl++;
            lbly = lbl++;
            printf("L%03d:\n", lblx);
            ex(p->opr.op[0], blbl, clbl);
            printf("\tjz\tL%03d\n", lbly);
            ex(p->opr.op[1], lbly, lblx);
            printf("\tjmp\tL%03d\n", lblx);
            printf("L%03d:\n", lbly);
            break;
        case IF:
            ex(p->opr.op[0], blbl, clbl);
            if (p->opr.nops > 2) {
                /* if else */
                printf("\tjz\tL%03d\n", lblx = lbl++);
                ex(p->opr.op[1], blbl, clbl);
                printf("\tjmp\tL%03d\n", lbly = lbl++);
                printf("L%03d:\n", lblx);
                ex(p->opr.op[2], blbl, clbl);
                printf("L%03d:\n", lbly);
            } else {
                /* if */
                printf("\tjz\tL%03d\n", lblx = lbl++);
                ex(p->opr.op[1], blbl, clbl);
                printf("L%03d:\n", lblx);
            }
            break;
        case READ:
            printf("\tread\n");
            if(p->opr.op[0]->type == typeId) {
                printf("\tpop\t%c\n", p->opr.op[0]->id.i + 'a');
            } else {
                printf("\tpopi\t%c\n", ex(p->opr.op[0], blbl, clbl)+'a');
            }
            break;
        case PRINT:
            ex(p->opr.op[0], blbl, clbl);
            printf("\tprint\n");
            break;
            case '=':
            ex(p->opr.op[1], blbl, clbl);
            if(p->opr.op[0]->type == typeId) {
                printf("\tpop\t%c\n", p->opr.op[0]->id.i + 'a');
            } else {
                printf("\tpopi\t%c\n", ex(p->opr.op[0], blbl, clbl)+'a');
            }
            break;
        case UMINUS:
            ex(p->opr.op[0], blbl, clbl);
            printf("\tneg\n");
            break;
            default:
            ex(p->opr.op[0], blbl, clbl);
            ex(p->opr.op[1], blbl, clbl);
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
    printf("\tprint\n");
    printf("\tpush\t999999\n");
    printf("\tprint\n");
    printf("\tpush\t999999\n");
    printf("\tprint\n");
    printf("L999:\n");
}
