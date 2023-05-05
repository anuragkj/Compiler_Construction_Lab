%{

#include<stdio.h>

void yyerror(char *);

#include "y.tab.h"
%}


%%

"#include<stdio.h>"    { return T_HEADER; }

int             { return T_INT; }

float           { return T_FLOAT; }
double          { return T_DOUBLE; }
char            { return T_CHAR; }
main            { return T_MAIN; }

do		{printf("ERROR! Reserved keyword do\n"); return -1;}
if		{printf("ERROR! Reserved keyword if\n"); return -1;}
while		{printf("ERROR! Reserved keyword while\n"); return -1;}
for		{printf("ERROR! Reserved keyword for\n"); return -1;}
\{              { return T_LCB; }

\}              { return T_RCB; }

\(              { return T_LB; }

\)              { return T_RB; }

\n              { yylineno++; }

[ \t]           ;

[0-9]+          { return T_NUMBER; }

[-+/*]          { return T_OP; }

=               { return T_EQ; }

[a-zA-Z][a-zA-Z0-9_]*       { return T_VARIABLE; }

","               { return T_COMMA; }

";"               { return T_SC; }

.             { return yytext[0]; }


%%


int yywrap()

{
return 1;
}