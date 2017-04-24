%option noyywrap
%{ 
  /* #include <stdlib.h> 
  void yyerror(char *); */
  #include "calx.tab.h" 
%} 

digits [0-9]+

%% 
  /* variables */ 
[a-z] { 
  yylval.var = *yytext - 'a'; 
  return VARIABLE; 
} 
  /* numbers */ 
{digits}("."{digits})? { 
  yylval.num = atof(yytext); 
  return NUM; 
} 
  /* operators */ 
[-+^()=/*\n] { return *yytext; } 
  /* skip whitespace */ 
[ \t] ; 
  /* anything else is an error */ 
. yyerror("invalid character"); 
