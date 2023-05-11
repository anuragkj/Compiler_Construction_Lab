%{
	#include<stdio.h>
	#include<stdlib.h>
	int yylex(void);
	void yyerror(char *);
%}

%%
S:	'a' A 'd'	{printf("Valid\n");}
 |	'b' B 'd'	{printf("Valid\n");}
 |	'a' A 'e'	{printf("Valid\n");}
 |	'b' B 'e'	{printf("Valid\n");}
 ;

A:	'a' 'b' 'd'	{printf("Token A found\n");}
 ;

B:	'b' 'c' 	{printf("Token B found\n");}
 ;
%%

void yyerror(char *s){
	printf("Invalid input!\n");
	exit(1);
}

int main(){
	printf("Input the string: ");
	yyparse();
	return 0;
}