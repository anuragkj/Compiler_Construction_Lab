%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'

%{
    #include<stdio.h>
    int flag=0;
    int yylex(void);
    int sym[26];
%}

%%

program:
    program statement '\n'
    |
    ;

statement:
    expr { printf("%d\n", $1); }
    | VARIABLE '=' expr { sym[$1] = $3; }
    ;

expr:
    INTEGER
    | VARIABLE { $$ = sym[$1]; }
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { $$ = $1 / $3; }
    | '(' expr ')' { $$ = $2; }
    ;
%%

void main()
{
printf("\nEnter Any Arithmetic Expression which	can have operations Addition, Subtraction, Multiplication, Division, Modulus and Round brackets:\n");

yyparse();
if(flag==0)
printf("\nEntered arithmetic expression is Valid\n\n");
}

void yyerror()
{
printf("\nEntered arithmetic expression is Invalid\n\n");
flag=1;
}