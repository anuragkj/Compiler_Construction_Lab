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
.   

%%

int yywrap()
{
return 1;
}
