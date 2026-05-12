#!/bin/bash
cat > scanner.l <<'EOF'
%{
#include "tokens.h"
#include "listing.h"
%}

%%

[ \t]+                          ;
\n                              { nextLine(); }

"//".*                          ;
"--".*                          ;

// Reserved words
"begin"                         { return BEGIN_; }
"case"                          { return CASE; }
"character"                     { return CHARACTER; }
"else"                          { return ELSE; }
"elsif"                         { return ELSIF; }
"end"                           { return END; }
"function"                      { return FUNCTION; }
"if"                            { return IF; }
"integer"                       { return INTEGER; }
"is"                            { return IS; }
"loop"                          { return LOOP; }
"procedure"                     { return PROCEDURE; }
"real"                          { return REAL; }
"returns"                       { return RETURNS; }
"then"                          { return THEN; }
"when"                          { return WHEN; }
"while"                         { return WHILE; }

// Operators and punctuation
"="                             { return '='; }
"/="                            { return NOT_EQ; }
">="                            { return GEQ; }
">"                             { return '>'; }
"<="                            { return LEQ; }
"<"                             { return '<'; }
":"                             { return ':'; }
";"                             { return ';'; }
","                             { return ','; }
".."                            { return DOT_DOT; }
"("                             { return '('; }
")"                             { return ')'; }
"+"                             { return '+'; }
"-"                             { return '-'; }
"*"                             { return '*'; }
"/"                             { return '/'; }
"**"                            { return EXPONENT; }
"mod"                           { return MOD; }
"rem"                           { return REM; }
"and"                           { return AND; }
"or"                            { return OR; }
"not"                           { return NOT; }

// Literals
[0-9]+\.[0-9]*([Ee][+-]?[0-9]+)? { return REAL_LITERAL; }
[0-9]+"."                       { return REAL_LITERAL; }
0[xX][0-9a-fA-F]+               { return INT_LITERAL; }
[0-9]+                          { return INT_LITERAL; }
'(\\[btnrf"\'\\])'|'[^\\'\r\n]' { return CHAR_LITERAL; }

// Identifier
[A-Za-z_][A-Za-z_0-9]*          { return IDENTIFIER; }

.                               { return ERROR; }

%%

int yywrap() {
    return 1;
}
EOF
