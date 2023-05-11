%{
	#include<stdio.h>
	#include<stdlib.h>
	#include "y.tab.h"
	void yyerror(char *);
%}

%%

[a-z] {return *yytext;}
[ \t] ;
. 	  {return yytext[0];}

%%

int yywrap(void){
	return 1;
}