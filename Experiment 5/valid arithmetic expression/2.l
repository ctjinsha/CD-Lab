%{
#include "2.tab.h"
%}
%%
[a-zA-Z_][a-zA-Z_0-9]* return id;
[0-9]+(\.[0-9]*)? return num;
[+/*] return op;
. return yytext[0];
\n return 0;
%%
2.y
%{
#include<stdio.h>
int v=1;
%}
%token num id op
%%
start : id '=' s ';'
s : id x
| num x
| '-' num x
| '(' s ')' x
;
x : op s
| '-' s
|
;
%%
int yyerror(){
v=0;
printf("Invalid arithmetic expression.\n");
return 0;
}
int main(){
printf("Enter the arithmetic expression: \n");
yyparse();
if(v){
printf("Valid expression.\n");
}
