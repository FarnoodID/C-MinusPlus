%%
[ \t] ;
[a-zA-Z][a-zA-Z0-9_]* printf("id");
[*+-/=()] printf("%s", yytext);
\n {printf("\n");return 0;}
%%
int yywrap(){}
int main(){
        yylex();
        return 0;
}

/* CodeBy FarnoodID */