%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;
%}

%%

[ \t]   { /* Ignore spaces and tabs */ }

[0-9]   { 
          yylval = yytext[0] - '0'; 
          return DIGIT; 
        }

\n      { return '\n'; }

.       { return yytext[0]; } /* Returns +, *, (, and ) directly to YACC */

%%
