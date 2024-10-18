%option noyywrap

%{
#include <stdio.h>

#define YY_DECL int yylex()

#include "lang.tab.h"

%}

 /* CodeBy FarnoodID */

%%

"/*".*"*/"	;
[ \t]	; // ignore all whitespace
[0-9]+\.[0-9]+ 	{yylval.fval = atof(yytext); return T_FLOAT;}
[0-9]+		{yylval.ival = atoi(yytext); return T_INT;}
\n		{return T_NEWLINE;}
"+"		{return T_PLUS;}
"-"		{return T_MINUS;}
"*"		{return T_MULTIPLY;}
"/"		{return T_DIVIDE;}
"("		{return T_LEFT;}
")"		{return T_RIGHT;}
"<="		{return T_LEQ;}
"<"		{return T_LESS_THAN;}
">="		{return T_GEQ;}
">"		{return T_GREATER_THAN;}
"="		{return T_EQUALS;}
"!="		{return T_NOT_EQUAL;}
"%"		{return T_MOD;}
"^"		{return A_XOR;}
"&"		{return A_AND;}
"|"		{return A_OR;}
"<<"		{return LEFT_SHIFT;}
">>"		{return RIGHT_SHIFT;}
"false"   	{yylval.ival = 0; return FALSE; }
"true"   	{yylval.ival = 1; return TRUE; }
"and"   	{return AND; }
"or"	   	{return OR; }
"xor"   	{return XOR; }
"not"   	{return NOT; }
"exit"		{return T_QUIT;}
"quit"		{return T_QUIT;}
"//".*		;

%%

 /* CodeBy FarnoodID */