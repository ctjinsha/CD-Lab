%{
#include <stdio.h>
#include <stdlib.h>

int count = 1;

/* Function prototypes to avoid C warnings */
int yylex(void);
void yyerror(char *str) {
    printf("%s at line %d\n", str, count);
}
int yywrap() { 
    return 1; 
}
%}

%token DIGIT
%left '+'
%left '*'

%%
list: list stat | /* empty */ ;

stat: expr '\n' { printf("Result: %d\n", $1); ++count; }
    | '\n'      { ++count; } /* Handles blank lines safely */
    ;

expr: '(' expr ')'  { $$ = $2; }
    | expr '+' expr { $$ = $1 + $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | number        { $$ = $1; }
    ;

number: DIGIT          { $$ = $1; }
      | number DIGIT   { $$ = 10 * $1 + $2; }
      ;

%%

int main() {
    printf("Enter expressions (e.g., 2+3*4):\n");
    yyparse();
    return 0;
}
