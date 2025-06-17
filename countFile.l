%{
#include <stdio.h>
int characters = 0, words = 0, whitespaces = 0;
FILE *fp;
%}

%%

[ \t\n]+      { whitespaces += yyleng; words++; }
.             { characters++; }

%%

int yywrap() {
    return 1;
}

int main() {
    fp = fopen("Input.txt", "r");
    if (!fp) {
        printf("File not found!\n");
        return 1;
    }
    yyin = fp;
    yylex();
    fclose(fp);

    printf("Total Characters: %d\n", characters + whitespaces);
    printf("Total Whitespaces: %d\n", whitespaces);
    printf("Total Words: %d\n", words);
    return 0;
}
