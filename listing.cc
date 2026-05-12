#include <iostream>
#include <fstream>
#include <queue>
#include <string>
#include "listing.h"

using namespace std;

static ifstream sourceFile;
static ofstream listingFile;
static int lineNumber;
static string line;
static queue<string> errorQueue;
static int lexicalErrors = 0;
static int syntaxErrors = 0;
static int semanticErrors = 0;

void openFiles()
{
    sourceFile.open("input.txt");
    listingFile.open("listing.txt");
    lineNumber = 0;
}

void closeFiles()
{
    sourceFile.close();
    listingFile.close();
}

void firstLine()
{
    getline(sourceFile, line);
    lineNumber++;
    listingFile << lineNumber << "  " << line << endl;
}

void nextLine()
{
    displayErrors();
    getline(sourceFile, line);
    lineNumber++;
    listingFile << lineNumber << "  " << line << endl;
}

int lastLine()
{
    displayErrors();
    listingFile << endl;
    if (lexicalErrors + syntaxErrors + semanticErrors > 0)
    {
        listingFile << "Lexical Errors " << lexicalErrors << endl;
        listingFile << "Syntax Errors " << syntaxErrors << endl;
        listingFile << "Semantic Errors " << semanticErrors << endl;
    }
    else
    {
        listingFile << "Compiled Successfully" << endl;
    }
    return lexicalErrors + syntaxErrors + semanticErrors;
}

void appendError(ErrorCategories errorCategory, string message)
{
    switch (errorCategory)
    {
        case LEXICAL: lexicalErrors++; break;
        case SYNTAX: syntaxErrors++; break;
        case SEMANTIC: semanticErrors++; break;
        default: break;
    }
    errorQueue.push(message);
}

void displayErrors()
{
    while (!errorQueue.empty())
    {
        listingFile << "Lexical Error, " << errorQueue.front() << endl;
        errorQueue.pop();
    }
}
