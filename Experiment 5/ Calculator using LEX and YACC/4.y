%{
#include<stdio.h>
int f=0;
%}
%token NUMBER
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
%%
ArithmeticExpression: E{
printf("Result=%d\n", $$);
return 0; };
E: E'+'E {$$=$1+$3;}
|E'-'E {$$=$1-$3;}
|E'*'E {$$=$1*$3;}
|E'/'E {$$=$1/$3;}
|E'%'E {$$=$1%$3;}
|'('E')' {$$=$2;}
| NUMBER {$$=$1;}
;
%%
int yyerror(){
printf("Entered arithmetic expression is Invalid\n\n");
f=1;
}
void main(){
printf("Enter Arithmetic Expression :\n");
yyparse();
if(f==0)
printf("\n");
}
