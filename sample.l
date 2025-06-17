%%
[0-9]+    printf("Integer: %s\n", yytext);
[ \t\n]   ;
.         printf("Other: %s\n", yytext);
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}

