%{
#include <stdio.h>
%}

%%
"abc"   { printf("ABC"); }
.|\n    { printf("%s", yytext); } /* Echo all other characters exactly as they are */
%%

int main() {
    printf("Enter text (occurrences of 'abc' will be converted to 'ABC'):\n");
    yylex();
    return 0;
}

int yywrap() { return 1; }
