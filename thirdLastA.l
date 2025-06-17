%{
#include <stdio.h>
#include <string.h>

char buffer[1000];
int pos = 0;
%}

%%
[a|b]   {
            buffer[pos++] = yytext[0];
       }

\n      {
            buffer[pos] = '\0';
            if (pos >= 3 && buffer[pos - 3] == 'a')
                printf("Accepted (3rd last is 'a')\n");
            else
                printf("Rejected \n");

            pos = 0;  // reset for next line
       }

[^ab\n]  { printf("Invalid input: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter strings over {a, b} (Press Ctrl+D to exit):\n");
    yylex();
    return 0;
}
