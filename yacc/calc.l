%{
#include<stdio.h>
#include "calc.tab.h"    
%}
keyword "pachhi"
keyword1 "kayu"
keyword2 "leap"
keyword3 "year"
keyword4 "chhe"
digit [0-9]
integer {digit}+
eol "?"
blank " "
%%
{keyword} { printf("%10s: keyword\n",yytext); return KEYWORD; }
{keyword1} {  printf("%10s: keyword1\n",yytext); return  KEYWORD1; }
{keyword2} { printf("%10s: keyword2\n",yytext); return  KEYWORD2; }
{keyword3} { printf("%10s: keyword3\n",yytext); return  KEYWORD3; }
{keyword4} { printf("%10s: keyword4\n",yytext); return  KEYWORD4; }
{eol} { printf("%10s: end of line\n",yytext); return F; }
{integer} { printf("%10s:integer\n",yytext); return NUM; }
{blank} {printf("%10s: space\n",yytext); return BLANK;}
. { printf("%10s: invalid\n",yytext); }

%%
int yywrap(void){
return 1;
}