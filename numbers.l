%{
#include <stdio.h>
%}

INTEGER     [0-9]+
FLOAT       [0-9]*\.[0-9]+([eE][+-]?[0-9]+)?

%%

{FLOAT}     { printf("Float: %s\n", yytext); }
{INTEGER}   { printf("Integer: %s\n", yytext); }
[ \t\n]     ;  // Skip whitespace
.           ;  // Ignore other characters

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
