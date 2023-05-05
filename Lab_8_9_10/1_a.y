%{
#include <stdio.h>
#include <stdlib.h>
%}

%token T_HEADER T_INT T_MAIN T_LB T_RB T_LCB T_RCB

%%

program: HEADER INT MAIN LB RB LCB RCB
	  {
            printf("Valid\n");
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

%%

int main() {
    printf("Enter a C program:\n");
    yyparse();
    return 0;
}

void yyerror(char *s) {
    printf("The provided code is invalid\n", s);
    exit(1);
}