How to run:
Create the files e.g. 1_a.l and 1_a.y
lex 1_a.l
yacc -d 1_a.y
cc lex.yy.c y.tab.c -w
./a.out

An example input which runs
#include<stdio.h>
int main()
{
float ab, cd, ef;
ab = cd+ef;
}

An example input which gives error:
#incude<stdi.h>


Questions:
1.	Write the LEX and YACC sourceto recognize the following:
a)	General Template:
The template for the C program is 
#include<stdio.h>
int main( )
{
} 
PGM -> HEADER INT MAIN LB RB LCB RCB

b)	Declaration statements:
Allow declaration statements inside the program body. Integer variables separated by comma can be declared inside the program body. A program can have multiple declaration statements. Variables are sequence of lower-case alphabets.Each declaration statement is ended by a semicolon.
int a, b;

PGM ->HEADER INTMAIN LB RB LCB BODY RCB
BODY -> DECL_STMTS
DECL_STMTS -> DECL_STMT DECL_STMTS | DECL_STMT
DECL_STMT ->INT VAR_LIST SC
VAR_LIST->VAR COMA VAR_LIST | VAR

c)	OPERATORS & PROGRAM STATEMENTS:
Allow declaration statements to be followed by program statements inside the program body. Program statements are ended by a semicolon. Program statements can be arithmetic expressions involving +-*/ operators.

PGM -> HEADER INT MAIN LB RB LCB BODY RCB
BODY -> DECL_STMTS PROG_STMTS
DECL_STMTS -> DECL_STMT DECL_STMTS | DECL_STMT
PROG_STMTS -> PROG_STMT PROG_STMTS | PROG_STMT	
DECL_STMT -> INT VAR_LIST SC
VAR_LIST -> VAR COMA VAR_LIST | VAR
PROG_STMT -> VAR EQ A_EXPN SC
A_EXPN -> A_EXPN OP A_EXPN | LB A_EXPN RB | VAR

2.	Modify your LEX program to incorporate the following changes
As per the current set up, the programmer is supposed to use only lower-case alphabets in variable names in their C program. Modify your lex program so as to let the programmer have uppercase letters A to Z together with digits 0 to 9 and underscore character in variable names. Ensure that a variable name always begin with a character.
Terminate your program with an error message if in case the programmer uses keywords if, while, do, and for as variable names. Note that it is permitted to have variable names beginning with keywords (ifvar, thenextcount, donut etc.) (hint: rely on conflict resolution rules in LEX).
Add provision to declare variables of type float, double and char.

