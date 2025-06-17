%{
#include <stdio.h>
%}

%%
[0-9]+\.[0-9]+      { printf("Float Constant: %s\n", yytext); }
[0-9]+              { printf("Integer Constant: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("Identifier: %s\n", yytext); }

[ \t\n]+            ; // Ignore whitespaces
.                   { printf("Other: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter tokens (Ctrl+D to end input):\n");
    yylex();
    return 0;
}
