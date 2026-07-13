%{ 
int c=0; 
int v=0; 
%} 
%% 
[AEIOUaeiou] { v++; } 
[A-Za-z] {c++;} 
. ; 
["\n"] {return 0;} 
%% 
int yywrap(){ } 
int main(){ 
printf("Enter text: \n"); 
yylex(); 
printf("No of vowels %d\n",v); 
printf("No of consonants %d\n",c); 
}
