%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
	int ival;
	float fval;
}

/* CodeBy FarnoodID */

%token<ival> T_INT
%token<fval> T_FLOAT
%token<ival> TRUE
%token<ival> FALSE
%token T_PLUS T_MINUS T_MULTIPLY T_DIVIDE T_LEFT T_RIGHT
%token T_LEQ T_LESS_THAN T_GEQ T_GREATER_THAN T_EQUALS T_NOT_EQUAL T_MOD AND OR XOR NOT A_AND A_OR A_XOR LEFT_SHIFT RIGHT_SHIFT
%token T_NEWLINE T_QUIT T
%left T_PLUS T_MINUS
%left T_MULTIPLY T_DIVIDE
%left T_LEQ T_LESS_THAN T_GEQ T_GREATER_THAN T_EQUALS T_NOT_EQUAL T_MOD AND NOT XOR OR A_AND A_OR A_XOR LEFT_SHIFT RIGHT_SHIFT

%type<ival> expression
%type<fval> mixed_expression

%start calculation

%%

calculation:
	   | calculation line
;

line: T_NEWLINE
    | mixed_expression T_NEWLINE { printf("%f\n", $1);}
    | expression T_NEWLINE { printf("%i\n", $1); }
    | T_QUIT T_NEWLINE { printf("Exiting...\n"); exit(0); }
;

mixed_expression: T_FLOAT                 		 { $$ = $1; }
	  | mixed_expression T_PLUS mixed_expression	 { $$ = $1 + $3; }
	  | mixed_expression T_MINUS mixed_expression	 { $$ = $1 - $3; }
	  | mixed_expression T_MULTIPLY mixed_expression { $$ = $1 * $3; }
	  | mixed_expression T_DIVIDE mixed_expression	 { $$ = $1 / $3; }
	  | T_LEFT mixed_expression T_RIGHT		 { $$ = $2; }
	  | expression T_PLUS mixed_expression	 	 { $$ = $1 + $3; }
	  | expression T_MINUS mixed_expression	 	 { $$ = $1 - $3; }
	  | expression T_MULTIPLY mixed_expression 	 { $$ = $1 * $3; }
	  | expression T_DIVIDE mixed_expression	 { $$ = $1 / $3; }
	  | mixed_expression T_PLUS expression	 	 { $$ = $1 + $3; }
	  | mixed_expression T_MINUS expression	 	 { $$ = $1 - $3; }
	  | mixed_expression T_MULTIPLY expression 	 { $$ = $1 * $3; }
	  | mixed_expression T_DIVIDE expression	 { $$ = $1 / $3; }
	  | expression T_DIVIDE expression		 { $$ = $1 / (float)$3; }
;

expression: T_INT				{ $$ = $1; }
	  | expression T_PLUS expression	{ $$ = $1 + $3; }
	  | expression T_MINUS expression	{ $$ = $1 - $3; }
	  | expression T_MULTIPLY expression	{ $$ = $1 * $3; }
	  | T_LEFT expression T_RIGHT		{ $$ = $2; }
	  | expression T_LESS_THAN expression          	{ $$ = ($1 < $3);
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
	  | expression T_LEQ expression          	{ $$ = ($1 <= $3);
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
          | expression T_GREATER_THAN expression          { $$ = ($1 > $3);
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
          | expression T_GEQ expression          	{ $$ = ($1 >= $3);
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
          | expression T_EQUALS expression          { $$ = ($1 == $3);
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
          | expression T_NOT_EQUAL expression         { $$ = ($1 != $3);
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
	  | expression AND expression          	{ $$ = $1 && $3;
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
	  | expression XOR expression          	{ $$ = $1 ^ $3;
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
	  | NOT expression 		          	{ $$ = !$2;
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
	  | TRUE                                { $$ = $1; }
          | FALSE                               { $$ = $1; }
	  | expression OR expression          	{ $$ = $1 || $3;
                  if ($$==1)
                 printf("TRUE \n");
                  else {
                    printf("FALSE \n");
                  }
                }
	  | expression A_AND expression      	{ $$ = $1 & $3;}
	  | expression A_XOR expression      	{ $$ = $1 ^ $3;}
	  | expression A_OR expression     	{ $$ = $1 | $3;}
	  | expression T_MOD expression        	{ $$ = $1 % $3;}
	  | expression LEFT_SHIFT expression  	{ $$ = $1 << $3;}
	  | expression RIGHT_SHIFT expression   { $$ = $1 >> $3;}

;

%%

int main() {
	yyin = stdin;

    /* CodeBy FarnoodID */

	do {
		yyparse();
	} while(!feof(yyin));

	return 0;
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}