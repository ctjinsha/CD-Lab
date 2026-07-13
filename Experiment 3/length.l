%{ 
%} 
%% 
[" "] ; 
[a-zA-Z0-9]+ { printf("length of word %s = %d\n",yytext,yyleng);} 
["$"] {return 0;} 
%% 
int yywrap(){ 
} 
int main(){ 
printf("Enter $ to end Typing ... \n"); 
yylex();
}
