%{
#include <stdio.h>

FILE *inFile, *outFile;
int spacePrinted = 0;
%}

%%

[ \t\n]+   {
              if (!spacePrinted) {
                  fputc(' ', outFile);
                  spacePrinted = 1;
              }
          }

.         {
              fputc(yytext[0], outFile);
              spacePrinted = 0;
          }

%%

int yywrap() {
    return 1;
}

int main() {
    inFile = fopen("Input.txt", "r");
    outFile = fopen("Output.txt", "w");

    if (!inFile || !outFile) {
        printf("Error opening files!\n");
        return 1;
    }

    yyin = inFile;
    yylex();

    fclose(inFile);
    fclose(outFile);

    printf("Processed successfully. Check Output.txt\n");
    return 0;
}
