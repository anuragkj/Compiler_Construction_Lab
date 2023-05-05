%{
#include<stdio.h>
void yyerror(char *);
#include "y.tab.h"
%}

%%
"#include<stdio.h>"    { return T_HEADER; }
int             { return T_INT; }
main            { return T_MAIN; }
\{              { return T_LCB; }
\}              { return T_RCB; }
\(              { return T_LB; }
\)              { return T_RB; }
\n              { yylineno++; }
[ \t]           ;
[0-9]+          { return T_NUMBER; }
[-+/*]          { return T_OP; }
=               { return T_EQ; }
[a-z]+          { return T_VARIABLE; }
","               { return T_COMMA; }
";"               { return T_SC; }
.             { return yytext[0]; }

%%

int yywrap()
{
return 1;
}