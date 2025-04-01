%{
#include <stdio.h>
%}

// Define keywords
KEYWORD       "int"|"char"|"return"|"void"|"main"

// Define identifiers (variable names, function names, etc.)
IDENTIFIER    [a-zA-Z_][a-zA-Z0-9_]*

// Define constants (numbers)
CONSTANT      [0-9]+

// Define strings (enclosed in single or double quotes)
STRING        \'[^\']*\'|\"[^\"]*\"


// Define operators
OPERATOR      "+"|"-"|"*"|"/"|"="

// Define punctuation
PUNCTUATION   "("|")"|"{"|"}"|","|";"

// Define whitespace (to ignore)
WHITESPACE    [ \t\n]

// Define comments (to ignore)
COMMENT       "//".*|"/*"(.|\n)*"*/"

%%

{KEYWORD}     { printf("Keyword: %s\n", yytext); }
{IDENTIFIER}  { printf("Identifier: %s\n", yytext); }
{CONSTANT}    { printf("Constant: %s\n", yytext); }
{STRING}      { printf("String: %s\n", yytext); }
{OPERATOR}    { printf("Operator: %s\n", yytext); }
{PUNCTUATION} { printf("Punctuation: %s\n", yytext); }
{WHITESPACE}  { /* Ignore whitespace */ }
{COMMENT}     { /* Ignore comments */ }
.             { printf("Invalid lexeme: %s\n", yytext); }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error opening file");
            return 1;
        }
        yyin = file;
    }

    yylex(); // Start the lexical analysis

    if (argc > 1) {
        fclose(yyin);
    }

    return 0;
}