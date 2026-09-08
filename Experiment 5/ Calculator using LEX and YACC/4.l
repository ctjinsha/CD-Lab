%{
#include<stdio.h>
#include "4.tab.h"
extern int yylval;
%}
%%
[0-9]+ { yylval=atoi(yytext);
return NUMBER;}
[\t] ;
[\n] return 0;
. return yytext[0];
%%
