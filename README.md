# C6C - A C-like language Compiler

## Description
The C6C Compiler is a compiler written by [Chen Jiali](https://github.com/Charliechen1), [Cao Chao](https://github.com/caochao39) as the final project of **COMP3235 Compiling Techniques(2016-2017 Second Semester)** at The University of Hong Kong. It mainly consists of a lexical analyser (**flex**), a parser (**bison**) and a code generator (**pure C**). It can compile a C-like language into assembly codes for a single stack machine (NAS). The implementation of this compiler is inspired by the **calc3** written by Tom Niemann in **Lex and Yacc Tutorial** and C4C compiler written by [Prof. Francis Chi Moon Lau](http://i.cs.hku.hk/~fcmlau/).

The C6C Compiler has implemented the following features:

- Variable declaration (local/global)
- Function (recursive) call with parameters
- Array (1D/2D/3D)
- String Manipulation
- Basic flow control (if else, while, for, continue, break)

## Usage

1. Download/Clone this repository into a suitable place. (Linux/Mac)
2. Install **flex** and **bison** if you don't have them yet.
3. Compile C6C
  ```
  make c6c
  ```
4. Compile NAS
  ```
  make nas
  ```
5. Compile test case into assemble code (Test cases can be found in the [tests](./tests) folder)
  ```
  ./c6c test.sc > test.as
  ```
6. Run test case
  ```
  ./nas test.as
  ```
7. Appreciate the magical result and star this repo. (Optional)

## Demo Case
We demo our C6C compiler using an application for playing the 24-point game written in the C-like language.

### Compile the game
```
./c6c 24pts.sc > 24pts.as
./nas 24pts.as
```

### Playing instructions

1. Press 's' to start the game
2. Choose a problem from the problem set (0 - 49)
3. Enter your calculation, press Enter to submit.
4. Or, give up and press 'h' check for the solutions
5. The program will check if your solution is correct and count your score accordingly.

### Features of the demo case
1. generation of a question base: before the start of game, we generate 50 solvable questions into the global Q matrix
2. an infix parser and evaluator: and infix calculator to evaluate the user answer, stacks are used.
  a. There are two stacks for this part, the value stack and opertor stack. \n
  b. Operators have their own precedence, and the order of the precedence is '(',')' < '+','-' < '\*', '\\'
  c. The input string will be scaned once, values (A, 2 ~ 10, J, Q, K) will be directly pushed into the value stack.
  d. For operator, if the current operator stack is empty, or it's a '(', or the current operator has a higher precedence compared with   the one on top of the operator stack, this operator will be pushed onto the operator stack
  e. otherwise, the top of the two stacks will be computed until a ')' is met or the above premises are broken
  f. when the scanning finishes, the remaining part in the two stack will be computed
  g. the last number in the value stack is result.
3. Stack operations: push, pop, peek
4. function to give all the solutions for a combination of 4 numbers: used when the user asks for help and when to generate question base
5. global variable and local variable: the global ones are defined at the begining
6. String dealt as char array: for string ALLTYPE and ALLOP, functions do their work by dealing them as char array. e.g. the valToChar()
7. Access global varaible in function. e.g. checkAns()
8. int, char, string put get operations
9. 2d array as parameter of a function. e.g. fetchQ()
