#include <stdio.h>
#include "listing.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

int main() {
    openFiles();
    nextLine();

    int token;
    while ((token = yylex())) {
        printf("Token: %d, Text: %s\n", token, yytext);
    }

    lastLine();
    closeFiles();
    return 0;
}
void openFiles();
void closeFiles();
