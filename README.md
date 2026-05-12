Tate Prodigalidad
CMSC 430
Project1 Documentation

1.	Approach
To implement the required changes for Project 1, I followed the recommended phased approach outlined in the course. I began by building the skeleton project using the provided makefile and verified that it compiled and executed properly on the initial test cases (test1.txt through test3.txt).

The next step was to implement all required modifications to the lexical analyzer (scanner.l) and token header file (tokens.h). I started by adding all required reserved words, then extended the language to support additional operators including logical, relational, arithmetic, and unary operators. Each new operator and reserved word was added to both the scanner rules and the Tokens enumeration.

Following this, I incorporated support for new token types: real literals, hexadecimal integers, updated character literals with escaped sequences, and a modified identifier rule to enforce the underscore constraints. I also added support for a new style of comments using ‘--'.

Lastly, I modified the compilation listing generator (listing.cc) to properly report multiple lexical errors on the same line, keep accurate error counts, and display either error statistics or a 'Compiled Successfully' message.

2.	Test Plan
Each test case was used to validate a specific portion of the lexical analyzer. The table below summarizes the test objectives and results.
Test Case	Description	Expected Result	Screenshot of compiler run on test case
test1.txt	Function with arithmetic expression	Compile successfully	 
test2.txt	Function with lexical error ($)	One lexical error reported	 
test3.txt	Same as test1 – re-validation	Compile successfully	 
test4.txt	Function with all reserved words	Compile successfully	 
test5.txt	Function with all new operators	Compile successfully	 
test6.txt	Function with literals and comments	Compile successfully	 
test7.txt	Function with multiple lexical errors on same line	Two lexical errors reported	 
test8.txt	Function with every operator, literal, and invalid identifiers	Five lexical errors reported	 
 
3.	Lessons Learned
This project was an excellent opportunity to learn about the inner workings of a lexical analyzer and gain hands-on experience with Flex and regular expressions. I learned how token patterns are designed and how subtle changes in rules can impact lexeme recognition.
Another key learning was how to handle escaped character sequences and real number formats in a robust way. Ensuring no conflicts between the different literal patterns required specific ordering of rules.
One challenge was correctly implementing the identifier rule with underscore constraints. It took some iteration and test case review to ensure that valid identifiers were accepted and invalid ones rejected, especially with triple and trailing underscores.
Another major challenge I encountered was correctly defining the regular expressions for real literals and identifiers, especially due to the strict language constraints. For example, real literals had to support scientific notation (e.g., .4e2, 4.3E+1), and identifiers were allowed to include underscores, but not start or end with them, and not allow more than two in a row. Initially, I wrote overly permissive patterns, which caused valid identifiers like name__1 to be rejected, and some invalid ones like name___2 to be incorrectly accepted.
Another significant challenge was integrating the updated scanner with the listing generator (listing.cc) to correctly display and tally lexical errors. Specifically, ensuring that multiple errors on a single line were all captured and displayed was not straightforward. Initially, only the first error per line was being recorded, and subsequent ones were ignored.
To resolve this, I had to carefully study and modify the appendError, displayErrors, and lastLine functions. I realized that errors needed to be queued and cleared after every line, and additonally that the queue had to be cleared after displaying to avoid duplicated messages. Debugging this required rerunning test7.txt, which intentionally includes multiple invalid characters on a single line. This test case was invaluable for verifying the accuracy of the final implementation.
If I were to improve anything, I would spend more time building custom test cases earlier in the process. This would help isolate edge cases sooner and lead to quicker debugging.
