%{
#include "y.tab.h"
%}

%%

[0-9]+             { yylval = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[ \t]              ; // Ignore whitespace

"+"                { return PLUS; }
"-"                { return MINUS; }
"*"                { return MUL; }
"/"                { return DIV; }
"("                { return LP; }
")"                { return RP; }

\n                 { return '\n'; }

.                  { return yytext[0]; } // Unknown character

%%
int yywrap() { return 1; }
