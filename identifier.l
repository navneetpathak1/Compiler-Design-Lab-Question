%{
#include <stdio.h>
#include <ctype.h>
%}

IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*

%%

{IDENTIFIER}    { printf("Valid Identifier: %s\n", yytext); }
[ \t\n]         ; // Skip whitespace
.               ; // Ignore other characters

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
