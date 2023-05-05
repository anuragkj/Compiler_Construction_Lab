%{

#include <stdio.h>

#include <stdlib.h>

%}


%token T_HEADER T_INT T_MAIN T_LB T_RB T_LCB T_RCB

%token T_NUMBER T_VARIABLE T_COMMA T_SC T_OP T_EQ

%left T_OP



%%



program: HEADER INT MAIN LB RB LCB BODY RCB

	  {

            printf("Valid\n");

        }

        ;


BODY:   DECL_STMTS PROG_STMTS

	    {

            printf("Token: Body\n");

        }

        ;


HEADER:
        T_HEADER

        {

            printf("Token: Header\n");

        }

        ;


INT:
        T_INT

        {

            printf("Token: Int\n");

        }

        ;


MAIN:
        T_MAIN

        {

            printf("Token: Main\n");

        }

        ;


LB:
        T_LB

        {

            printf("Token: Left_Bracket\n");

        }

        ;


RB:
        T_RB

        {

            printf("Token: Right_Bracket\n");

        }

        ;


LCB:
        T_LCB

        {

            printf("Token: Left_Curly_Bracket\n");

        }

        ;


RCB:
        T_RCB

        {

            printf("Token: Right_Curly_Bracket\n");

        }

        ;



DECL_STMTS:  DECL_STMT DECL_STMTS

        |   DECL_STMT

        {

            printf("Token: Statement\n");

        }

        ;


PROG_STMTS: PROG_STMT PROG_STMTS

          | PROG_STMT

          ;


DECL_STMT:  T_INT VAR_LIST T_SC

        ;


VAR_LIST:   T_VARIABLE T_COMMA VAR_LIST

        |   T_VARIABLE

        ;


PROG_STMT: T_VARIABLE T_EQ A_EXPN T_SC

         ;


A_EXPN: A_EXPN T_OP A_EXPN

      | T_LB A_EXPN T_RB

      | T_VARIABLE

      | T_NUMBER

      ;






%%


int main() 
{
    printf("Enter a C program:\n");
    
yyparse();
    
return 0;
}


void yyerror(char *s) 
{
    
	printf("The provided code is invalid\n", s);
    	exit(1);
}