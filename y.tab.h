/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INTEGER = 258,
    CHARACTER = 259,
    STRING = 260,
    VARIABLE = 261,
    FOR = 262,
    WHILE = 263,
    IF = 264,
    PRINT = 265,
    READ = 266,
    BREAK = 267,
    CONTINUE = 268,
    OFFSET = 269,
    RVALUE = 270,
    IFX = 271,
    ELSE = 272,
    AND = 273,
    OR = 274,
    GE = 275,
    LE = 276,
    EQ = 277,
    NE = 278,
    UMINUS = 279
  };
#endif
/* Tokens.  */
#define INTEGER 258
#define CHARACTER 259
#define STRING 260
#define VARIABLE 261
#define FOR 262
#define WHILE 263
#define IF 264
#define PRINT 265
#define READ 266
#define BREAK 267
#define CONTINUE 268
#define OFFSET 269
#define RVALUE 270
#define IFX 271
#define ELSE 272
#define AND 273
#define OR 274
#define GE 275
#define LE 276
#define EQ 277
#define NE 278
#define UMINUS 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 23 "c6.y" /* yacc.c:1909  */

    int iValue;                 /* integer value */
    char *sValue;		/* address of the string */
    char sIndex;                /* symbol table index */
    nodeType *nPtr;             /* node pointer */

#line 109 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
