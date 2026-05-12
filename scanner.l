%{
#include <string>
#include "tokens.h"
#include "listing.h"
using namespace std;
%}

%option noyywrap

%%

[ \t\r\f\v]+              ;
\n                        { nextLine(); }

"else"                    { return ELSE; }
"elsif"                   { return ELSIF; }
"endfold"                 { return ENDFOLD; }
"endif"                   { return ENDIF; }
"fold"                    { return FOLD; }
"if"                      { return IF; }
"left"                    { return LEFT; }
"real"                    { return REAL; }
"right"                   { return RIGHT; }
"then"                    { return THEN; }

","                       { return COMMA; }
":"                       { return COLON; }
";"                       { return SEMICOLON; }
"("                       { return LPAREN; }
")"                       { return RPAREN; }
"["                       { return LBRACKET; }
"]"                       { return RBRACKET; }
"=>"                      { return ARROW; }

"function"                { return FUNCTION; }
"main"                    { return IDENTIFIER; }
"returns"                 { return RETURNS; }
"integer"                 { return INTEGER; }
"begin"                   { return BEGIN_; }
"end"                     { return END; }
"is"                      { return IS; }
"list"                    { return LIST; }
"of"                      { return OF; }
"others"                  { return OTHERS; }
"switch"                  { return SWITCH; }
"when"                    { return WHEN; }
"case"                    { return CASE; }

"&"                       { return ANDOP; }
"|"                       { return OROP; }
"!"                       { return NOTOP; }
"="                       { return RELOP; }
"<>"                      { return RELOP; }
">"                       { return RELOP; }
">="                      { return RELOP; }
"<"                       { return RELOP; }
"<="                      { return RELOP; }
"+"                       { return ADDOP; }
"-"                       { return ADDOP; }
"*"                       { return MULOP; }
"/"                       { return MULOP; }
"%"                       { return REMOP; }
"^"                       { return EXPOP; }
"~"                       { return NEGOP; }

[0-9]+                             { return INTEGER_LIT; }
#[0-9a-fA-F]+                      { return HEX_LIT; }
[0-9]*\.[0-9]+([eE][+-]?[0-9]+)?   { return REAL_LIT; }

'\\[btnrf]'                        { return CHAR_LIT; }
'[^\\]'                            { return CHAR_LIT; }

([a-zA-Z][a-zA-Z0-9]*(_{1,2}[a-zA-Z0-9]+)*)   { return IDENTIFIER; }

"//"[^\n]*                         ;
"--"[^\n]*                         ;

.                                  { appendError(LEXICAL, string("Invalid Character ") + yytext); }

%%
