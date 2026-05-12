#include <iostream>
using namespace std;

extern int yylex();
extern void nextLine();
extern void displayErrors();

int main() {
    nextLine();
    yylex();
    displayErrors();
    return 0;
}
