%{
    #include<stdio.h>
    #include<stdlib.h>
    int yylex(void);
    void yyerror(char *);
%}

%token T_FOR T_ID T_NUM T_PROGRAM T_P T_N

%%

FOR_LOOP:   T_FOR '(' VARIABLE '=' EXPRESSION ';' EXPRESSION ';' INCDEC ')' STATEMENT
        {printf("Valid\n");}
        ;

VARIABLE:   T_ID
        {printf("Variable found\n");}
        ;

EXPRESSION: T_NUM   {printf("Expression found\n");}
          | T_ID    {printf("Expression found\n");}
          | T_ID '+' T_NUM  {printf("Expression found\n");}
          | T_ID '-' T_NUM  {printf("Expression found\n");}
          | T_ID '+' T_ID   {printf("Expression found\n");}
          | T_ID '-' T_ID   {printf("Expression found\n");}
          | T_ID '>' T_NUM  {printf("Expression found\n");}
          | T_ID '<' T_NUM  {printf("Expression found\n");}
          | T_ID '>' T_ID   {printf("Expression found\n");}
          | T_ID '<' T_ID   {printf("Expression found\n");}
          ;

STATEMENT:  '{' T_PROGRAM '}'   {printf("Statement found\n");}
         |  FOR_LOOP    {printf("Statement found\n");}
         |  ASSIGNMENT  {printf("Statement found\n");}
         |  '{' ASSIGNMENT ';' '}'   {printf("Statement found\n");}
          ;

ASSIGNMENT: VARIABLE '=' EXPRESSION
          {printf("Assignment found\n");}
          ;

INCDEC: ASSIGNMENT
      | VARIABLE T_P
      | VARIABLE T_N
      ;
%%

void yyerror(char *s){
    printf("Error in input\n");
    exit(1);
    return 0;
}

int main(void){
    printf("Enter the program: ");
    yyparse();
    return 0;
}