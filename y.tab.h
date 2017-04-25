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
    STRING = 259,
    VARIABLE = 260,
    FOR = 261,
    WHILE = 262,
    IF = 263,
    PRINT = 264,
    READ = 265,
    BREAK = 266,
    CONTINUE = 267,
    OFFSET = 268,
    RVALUE = 269,
    IFX = 270,
    ELSE = 271,
    AND = 272,
    OR = 273,
    GE = 274,
    LE = 275,
    EQ = 276,
    NE = 277,
    UMINUS = 278
  };
#endif
/* Tokens.  */
#define INTEGER 258
#define STRING 259
#define VARIABLE 260
#define FOR 261
#define WHILE 262
#define IF 263
#define PRINT 264
#define READ 265
#define BREAK 266
#define CONTINUE 267
#define OFFSET 268
#define RVALUE 269
#define IFX 270
#define ELSE 271
#define AND 272
#define OR 273
#define GE 274
#define LE 275
#define EQ 276
#define NE 277
#define UMINUS 278

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 22 "c6.y" /* yacc.c:1909  */

    int iValue;                 /* integer value */
    char *sValue;		/* address of the string */
    char sIndex;                /* symbol table index */
    nodeType *nPtr;             /* node pointer */

#line 107 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
