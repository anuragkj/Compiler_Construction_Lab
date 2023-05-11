%{
    #include<stdio.h>
    #include<stdlib.h>
    #include "y.tab.h"
    void yyerror(char *);
%}

program ^printf\("%d\\n",i\);*$
digit   [0-9]
num     {digit}+
letter  [a-zA-Z]
id      {letter}({letter}|{digit}|_)*


%%

for     {printf("%s\n","for");return T_FOR;}
{program}     {printf("%s\n","program");return T_PROGRAM;}
{id}    {printf("%s\n","id");return T_ID;}
{num}   {printf("%s\n","num returned");return T_NUM;}
[-+\(\){}/*=<>;]    {printf("%s\n",yytext);return *yytext;}
"++"    {return T_P;}
"--"    {return T_N;}

%%

int yywrap(void){
    return 1;
}