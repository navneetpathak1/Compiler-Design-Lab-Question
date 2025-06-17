# 🛠 Compiler Design Lab – LEX and YACC Programs

This repository contains LEX and YACC source codes for common **compiler design practical questions**, including lexical analysis tasks, tokenizing C fragments, simple DFAs, expression parsing, and evaluation.

---

## 🗂 Directory Structure

.
├── count_lines.l # Q1: Count lines, spaces, tabs, other characters
├── valid_identifier.l # Q2: Print valid identifiers
├── int_float_recognizer.l # Q3: Print integers and floats
├── tokenizer.l # Q4: Tokenize keywords, operators, identifiers
├── countFile.l # Q5: Count chars, words, whitespaces in a file
├── replaceWhite.l # Q6: Replace whitespaces with single space
├── removeComments.l # Q7: Remove comments from a C file
├── extractTags.l # Q8: Extract HTML tags to a file
├── even_a_b_dfa.l # Q9: DFA for even a's and even b's
├── thirdLastA.l # Q10: DFA to accept if third-last character is 'a'
├── identify_tokens.l # Q11: Recognize ints, floats, and identifiers
├── expr_check.l/y # Q12: Recognize valid arithmetic expressions
├── expr_eval1.l/y # Q13a: Evaluate expressions (No precedence)
├── expr_eval2.l/y # Q13b: Evaluate expressions (With precedence)
└── README.md # This file


---

## ✅ How to Run Each Program

### 🔧 1. Compile the LEX program
```bash
flex filename.l
gcc lex.yy.c -lfl -o outputName
./outputName

🛠 2. For LEX + YACC programs:

yacc -d filename.y         # Generates y.tab.c and y.tab.h
flex filename.l            # Generates lex.yy.c
gcc lex.yy.c y.tab.c -lfl -o outputName
./outputName

📋 Program List
Q.No	Title
1.	Count lines, spaces, tabs, other characters
2.	Identify and print valid identifiers in C/C++
3.	Identify and print integer and float values
4.	Tokenize C code: keywords, operators, separators, identifiers
5.	Count total characters, whitespaces, and words from Input.txt
6.	Replace multiple whitespaces with a single space in Input.txt and write to Output.txt
7.	Remove comments from C program and save to out.c
8.	Extract HTML tags from a file and store into a given output file
9.	DFA: Accept strings with even number of ‘a’ and ‘b’
10.	DFA: Accept strings where third-last character is ‘a’
11.	Identify integers, floats, and identifiers
12.	YACC+LEX: Validate arithmetic expressions (+, -, *, /)
13.	YACC+LEX: Evaluate expressions
→ 13a: Without precedence
→ 13b: With precedence (-%left '+' '-'  -%left '*' '/')

🧪 Sample Input/Output

Q13a: Without Operator Precedence

Input: 2 + 3 * 4
Output: Result = 20

Q13b: With Operator Precedence

Input: 2 + 3 * 4
Output: Result = 14

📝 Notes

    All .l and .y files are written in pure LEX/YACC without external libraries.

    Tested on: Ubuntu 20.04+ with flex, bison, and gcc installed.

    For input files like Input.txt, make sure the file exists in the same directory.

    Use Ctrl+D to end multiline input where required.

📦 Dependencies

sudo apt update
sudo apt install flex bison gcc

👨‍💻 Author

Navneet Pathak


---
