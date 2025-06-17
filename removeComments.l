%{
#include <stdio.h>

FILE *inFile, *outFile;
%}

%%

"//".*                { /* single-line comment: ignore */ }
"/*"([^*]|\*+[^*/])*\*+"/"    { /* multi-line comment: ignore */ }

.|\n                  { fputc(yytext[0], outFile); }

%%

int yywrap() {
    return 1;
}

int main() {
    char filename[100];
    printf("Enter C file name: ");
    scanf("%s", filename);

    inFile = fopen(filename, "r");
    outFile = fopen("out.c", "w");

    if (!inFile || !outFile) {
        printf("Error opening file!\n");
        return 1;
    }

    yyin = inFile;
    yylex();

    fclose(inFile);
    fclose(outFile);

    printf("Comments removed. Check 'out.c'\n");
    return 0;
}
