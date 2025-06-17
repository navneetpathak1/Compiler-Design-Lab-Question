%{
#include <stdio.h>
#include <string.h>

char* keywords[] = {"int", "float", "if", "else", "while", "return", "for", "do", "char", "void", NULL};

int isKeyword(char* word) {
    for (int i = 0; keywords[i] != NULL; i++) {
        if (strcmp(word, keywords[i]) == 0)
            return 1;
    }
    return 0;
}
%}

%%

"=="|">="|"<="|"!="|"="|"+"|"-"|"*"|"/"|"%"      { printf("Operator: %s\n", yytext); }
"(" | ")" | "{" | "}" | ";" | ","               { printf("Separator: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*                          {
                                                    if (isKeyword(yytext))
                                                        printf("Keyword: %s\n", yytext);
                                                    else
                                                        printf("Identifier: %s\n", yytext);
                                                }
[ \t\n]                                         ; // Ignore whitespace
.                                               ; // Ignore others

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}
