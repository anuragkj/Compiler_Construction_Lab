Steps to run: Same as last lab

Questions:

1.     Understand the working of LEX and YACC using a simple calculator application. Your calculator should provide arithmetic operators + and - that can add or subtract integers respectively (once). Start off with a grammar (not perfect).

Program à E \n

E à E + E | E - E | int

The problems with the above grammar – ambiguity. Associativity is not considered. Understand the conflicts in bottom up parsing and YACC’s default action when there is a conflict.

 

2.     Modify your program to take care of associativity of the operators using directives in YACC. + and – are left associative. Also modify the grammar so the calculator application runs until the user quits using <CTRL + D>.

 

3.     Extend the calculator to incorporate some new functionality. New features include arithmetic operators * and / that can multiply and divide integers respectively. Parentheses may be used to over-ride operator precedence. Note * and / operators have higher precedence over + and – operators. Also note that * and / are left associative. Ensure this using directive in YACC.

 

4.     Modify the grammar to allow single-character variables to be specified in assignment statements. The following illustrates sample input and calculator output:

user: 3 * (4 + 5)

calc: 27

user: x = 3 * (4 + 5)

user: y = 5

user: x

calc: 27

user: y

calc: 5

user: x + 2*y

calc: 37

