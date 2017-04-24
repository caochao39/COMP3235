%{
#include <stdio.h>
#include <math.h>
%}

%union { int var; float num; }

%token <num>NUM <var>VARIABLE 
%left '+' '-' 
%left '*' '/' 
%right '^'

%{ 
  void yyerror(char *); 
  int yylex(void); 
  float sym[26]; 
%} 

%type <num> statement expr

%% 
program: 
  program statement '\n' 
  | 
  ; 
statement: 
  expr { printf("%6.2f\n", $1); } 
  | VARIABLE '=' expr { sym[$1] = $3; } 
  | {;}
  ; 
expr: 
  NUM 
  | VARIABLE { $$ = sym[$1]; } 
  | expr '+' expr { $$ = $1 + $3; } 
  | expr '-' expr { $$ = $1 - $3; } 
  | expr '*' expr { $$ = $1 * $3; } 
  | expr '/' expr { $$ = $1 / $3; } 
  | expr '^' expr { $$ = pow($1,$3); } 
  | '(' expr ')' { $$ = $2; } 
  ; 
%% 
void yyerror(char *s) { 
  fprintf(stderr, "%s\n", s); 
} 
int main(void) { 
  yyparse(); 
  return 0; 
} 
