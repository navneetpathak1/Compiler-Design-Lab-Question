%{
#include <stdio.h>
FILE *inFile, *outFile;
%}

%%

"<"[^>]*">"   { fprintf(outFile, "%s\n", yytext); }  // Match and save HTML tags

.|\n          ;  // Ignore other characters

%%

int yywrap() {
    return 1;
}

int main() {
    char inName[100], outName[100];
    printf("Enter HTML input filename: ");
    scanf("%s", inName);
    printf("Enter output filename: ");
    scanf("%s", outName);

    inFile = fopen(inName, "r");
    outFile = fopen(outName, "w");

    if (!inFile || !outFile) {
        printf("Error opening files!\n");
        return 1;
    }

    yyin = inFile;
    yylex();

    fclose(inFile);
    fclose(outFile);

    printf("HTML tags extracted. Check '%s'\n", outName);
    return 0;
}
