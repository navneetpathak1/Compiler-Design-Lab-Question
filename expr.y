%{
#include <stdio.h>
#include <stdlib.h>

int yylex();              
int yyerror(char *);      // Declare yyerror imp
%}

%token NUM ID
%token PLUS MINUS MUL DIV LP RP

%%
stmt : expr '\n'   { printf("Valid expression\n"); }
     ;

expr : expr PLUS expr
     | expr MINUS expr
     | expr MUL expr
     | expr DIV expr
     | LP expr RP
     | ID
     | NUM
     ;
%%

int yyerror(char *s) {
    printf(" Invalid expression: %s\n", s);
    return 0;
}

int main() {
    printf("Enter an arithmetic expression:\n");
    return yyparse();
}
