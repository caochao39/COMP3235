%{
#include <stdlib.h>
#include "calc3.h"
#include "y.tab.h"
void yyerror(char *);
char text[500];
%}

%x S

%%

[a-z]       {
                yylval.sIndex = *yytext - 'a';
                return VARIABLE;
            }

0           {
                yylval.iValue = atoi(yytext);
                return INTEGER;
            }

[1-9][0-9]* {
                yylval.iValue = atoi(yytext);
                return INTEGER;
            }

[-()<>=+*/;{}.%\[\]] {
                return *yytext;
             }

">="        return GE;
"<="        return LE;
"=="        return EQ;
"!="        return NE;
"for"       return FOR;
"while"     return WHILE;
"if"        return IF;
"else"      return ELSE;
"print"     return PRINT;
"read"      return READ;
"&&"        return AND;
"||"        return OR;
"break"     return BREAK;
"continue"  return CONTINUE;

\/\/.*\n    ;    /* skip comments */

\"		{ BEGIN S; *text = 0; }
<S>[^"\\]*	{ strcat(text, yytext); }
<S>\"		{ yylval.sValue = text; BEGIN 0; return STRING; }
<S>\\\"		{ strcat(text, "\""); }
<S>\\n		{ strcat(text, "\n"); }
<S>\\t		{ strcat(text, "\t"); }
<S>\\		{ strcat(text, "\\"); }

[ \t\n]+    ;       /* ignore whitespace */

'\\n'		{ yylval.iValue = (int) '\n'; return INTEGER; }
'\\t'		{ yylval.iValue = (int) '\t'; return INTEGER; }
'\\''		{ yylval.iValue = (int) '\''; return INTEGER; }
''		{ yylval.iValue = 0; return INTEGER; }
'[^']'		{ yylval.iValue = (int) yytext[1]; return INTEGER; }

.           yyerror("Unknown character");

%%

int yywrap(void) {
    return 1;
}
