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
    CHARACTER = 260,
    VARIABLE = 261,
    FOR = 262,
    WHILE = 263,
    IF = 264,
    BREAK = 265,
    CONTINUE = 266,
    RETURN = 267,
    PUTI = 268,
    PUTC = 269,
    PUTS = 270,
    PUTI_ = 271,
    PUTC_ = 272,
    PUTS_ = 273,
    GETI = 274,
    GETC = 275,
    GETS = 276,
    ARRAY = 277,
    ARRAY_DECLARE = 278,
    PARAM_ARRAY_DECLARE = 279,
    STRING_ARRAY_DECLARE = 280,
    IFX = 281,
    ELSE = 282,
    AND = 283,
    OR = 284,
    GE = 285,
    LE = 286,
    EQ = 287,
    NE = 288,
    UMINUS = 289
  };
#endif
/* Tokens.  */
#define INTEGER 258
#define STRING 259
#define CHARACTER 260
#define VARIABLE 261
#define FOR 262
#define WHILE 263
#define IF 264
#define BREAK 265
#define CONTINUE 266
#define RETURN 267
#define PUTI 268
#define PUTC 269
#define PUTS 270
#define PUTI_ 271
#define PUTC_ 272
#define PUTS_ 273
#define GETI 274
#define GETC 275
#define GETS 276
#define ARRAY 277
#define ARRAY_DECLARE 278
#define PARAM_ARRAY_DECLARE 279
#define STRING_ARRAY_DECLARE 280
#define IFX 281
#define ELSE 282
#define AND 283
#define OR 284
#define GE 285
#define LE 286
#define EQ 287
#define NE 288
#define UMINUS 289

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE YYSTYPE;
union YYSTYPE
{
#line 75 "c6.y" /* yacc.c:1909  */

    int iValue;                 /* integer value */
    char *sValue;		/* address of the string */
    char *vName;                /* symbol table index */
    nodeType *nPtr;             /* node pointer */

#line 129 "y.tab.h" /* yacc.c:1909  */
};
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
