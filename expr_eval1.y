%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(char *s);
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%
stmt : expr '\n' { printf("Result = %d\n", $1); }
     ;

expr : expr '+' expr   { $$ = $1 + $3; }
     | expr '-' expr   { $$ = $1 - $3; }
     | expr '*' expr   { $$ = $1 * $3; }
     | expr '/' expr   { $$ = $1 / $3; }
     | '(' expr ')'    { $$ = $2; }
     | NUM             { $$ = $1; }
     ;
%%

int yyerror(char *s) {
    printf("Syntax Error: %s\n", s);
    return 0;
}

int main() {
    printf("Enter an arithmetic expression:\n");
    return yyparse();
}
