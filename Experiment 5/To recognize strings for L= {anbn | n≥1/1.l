%option caseless
%{
#include "1.tab.h"
%}
%%
[a] {return A;}
[b] {return B;}
\n {return NL;}
. {return yytext[0];}
%%
