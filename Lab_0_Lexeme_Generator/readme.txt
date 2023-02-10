Lab Exercise 0
Design a mini compiler
Write a program in C which takes another C program as input (use the sample input given below to construct the C program) and checks whether the input ﬁle contains a C statement of the form X = Y + Z; where X, Y and Z are variables. For each statement of the above form, check whether the variables are declared. You could assume each C statement to be present in a separate line and each variable to be declared in a separate line. Further, the only supported data type is “int”
Sample Input:
int a;
int b;
int c;
a = b + c;
c = b + d;
For Reading C Program:
#include <stdio.h>
#include <stdlib.h>
int main(void) 
{
FILE *fp = fopen("sample1.c", "r");
if(fp == NULL) {
perror("Unable to open file!");
 			exit(1);
 	}
char buffer[128];
 		while(fgets(buffer, sizeof(buffer), fp) != NULL) {
fputs(buffer, stdout);
fputs("\n", stdout);  
}

fclose(fp); 

}
