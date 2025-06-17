%{
#include "y.tab.h"
%}

%%

[0-9]+     { yylval = atoi(yytext); return NUM; }

[ \t]      ; // ignore spaces
[\n]       { return '\n'; }

"+"        { return '+'; }
"-"        { return '-'; }
"*"        { return '*'; }
"/"        { return '/'; }
"("        { return '('; }
")"        { return ')'; }

.          { printf("Unknown character: %s\n", yytext); }

%%

int yywrap() { return 1; }
