%token INTEGER VARIABLE
%left '+' '-'

%{
    #include<stdio.h>
    int flag=0;
    int yylex(void);
%}

%%

program:
    program statement '\n'
    |
    ;

statement:
    expr { printf("%d\n", $1); }
    ;

expr:
    INTEGER
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    ;
%%

void main()
{
printf("\nEnter Any Arithmetic Expression which	can have operations Addition or Subtraction:\n");

yyparse();
if(flag==0)
printf("\nEntered arithmetic expression is Valid\n\n");
}

void yyerror()
{
printf("\nEntered arithmetic expression is Invalid\n\n");
flag=1;
}