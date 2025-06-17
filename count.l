%{
int lines = 0, spaces = 0, tabs = 0, others = 0;
%}

%%

\n      { lines++; }
" "     { spaces++; }
\t      { tabs++; }
.       { others++; }

%%

int main() {
    yylex();
    printf("Total Lines: %d\n", lines);
    printf("Total Spaces: %d\n", spaces);
    printf("Total Tabs: %d\n", tabs);
    printf("Total Other Characters: %d\n", others);
    return 0;
}

int yywrap() {
    return 1;
}
