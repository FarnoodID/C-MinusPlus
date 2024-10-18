# C-MinusPlus Language Compiler

Welcome to the **C-MinusPlus** Language Compiler! This repository contains the implementation of a new programming language called C-MinusPlus, designed to provide a fun and educational experience in programming language development. Below, you will find detailed information about the project, its structure, features, and how to run it.

## Repository Structure

The repository consists of the following files:

- **`lang.l`**: The lexer specification for the C-MinusPlus language.
- **`lang.y`**: The parser specification for the C-MinusPlus language.
- **`ex1.l`, `ex2.l`, `ex3.l`, `ex4.l`**: Example lexers demonstrating various functionalities of the language.
- **`run.sh`**: A shell script to automate the compilation and execution of the compiler.
- **`README.md`**: This documentation file.

## Features of C-MinusPlus

C-MinusPlus supports a variety of operations that make it versatile for basic programming tasks. Here’s a detailed list of its features:

1. **Arithmetic Operations**:
   - Addition (`+`)
   - Subtraction (`-`)
   - Multiplication (`*`)
   - Division (`/`)
   - Modulus (`%`)
   - Arithmetic shifts (`<<`, `>>`)

2. **Comparison Operators**:
   - Less than (`<`)
   - Greater than (`>`)
   - Less than or equal to (`<=`)
   - Greater than or equal to (`>=`)
   - Equality (`==`)
   - Inequality (`!=`)

3. **Logical Operations**:
   - Logical AND (`and`)
   - Logical OR (`or`)
   - Logical NOT (`not`)
   - Logical XOR (`xor`)

4. **Bitwise Operations**:
   - Bitwise AND (`&`)
   - Bitwise OR (`|`)
   - Bitwise XOR (`^`)

5. **Comments**:
   - Single-line comments using `//`
   - Multi-line comments using `/* comment */`

6. **Control Flow**:
   - Exit commands: `quit`, `exit`

## Example Lexers

#### 1. ex1.l

This example demonstrates a simple lexer that recognizes the string "hello world" and prints "Good Bye" when it encounters it.

```c
%%
"hello world" printf("Good Bye\n");
. ;
%%
```

#### 2. ex2.l
This lexer counts the number of capital letters in the input text and prints each character's status (whether it is a capital letter or not).
```c
%{
int count = 0;
%}

%%
[A-Z] {printf("%s capital letter\n", yytext);
	count++;}
.	 {printf("%s not a capital letter\n", yytext);}
\n {return 0;}
%%

int yywrap(){}
int main(){
	yylex();
	printf("\nNumber of Capital letters in the given input - %d\n", count);
	return 0;
}
```

#### 3. ex3.l
This lexer counts the number of lines and characters in the input text, printing the totals when finished.
```c
%{
int no_of_lines = 0;
int no_of_chars = 0;
%}

%%
\n	 ++no_of_lines;
.	 ++no_of_chars;
end	 return 0;
%%

int yywrap(){}
int main(int argc, char **argv)
{
	yylex();
	printf("number of lines = %d, number of chars = %d\n",no_of_lines, no_of_chars );
	return 0;
}
```

#### 4. ex4.l
This lexer identifies identifiers (variable names) and prints them while also recognizing operators and printing them accordingly.
```c
%%
[ \t] ;
[a-zA-Z][a-zA-Z0-9_]* printf("id");
[*+-/=()] printf("%s", yytext);
\n {printf("\n");return 0;}
%%
int yywrap(){}
int main(){
        yylex();
        return 0;
}
```

## Running the Project
To run this project, follow these steps:
1. Clone the Repository:
   ```bash
   git clone https://github.com/FarnoodID/C-MinusPlus
   cd C-MinusPlus
   ```
   
2. Make Sure You Have Required Tools Installed:
Ensure you have Flex and Bison installed on your Ubuntu system. You can install them using:
   ```bash
   sudo apt-get install flex bison
   ```
   
3. Run the Script:
Execute the run.sh script to compile and run the compiler:
   ```bash
   chmod +x run.sh
   ./run.sh
   ```
This script will generate necessary files from .l and .y files, compile them into an executable, remove intermediate files, and then run the compiler.

## Project Implementation Details
The project has been tested on Ubuntu 20.04.5 LTS distribution. 

## How It Works
- The lexer scans input code and produces tokens based on predefined patterns.
- The parser processes these tokens according to defined grammar rules, allowing for arithmetic calculations, logical evaluations, and other operations.
- The example lexers show practical implementations of specific functionalities such as counting characters or lines, identifying capital letters, and handling simple input strings.

## Conclusion
Thank you for exploring the C-MinusPlus Language Compiler! I hope this project inspires you to dive deeper into programming languages and compiler design. If you have any questions or suggestions, feel free to reach out or contribute to this repository!

Happy coding!
