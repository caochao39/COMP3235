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

1. Press 's' to start the game.
2. Choose a problem from the problem set (0 - 49).
3. Enter your calculation, press Enter to submit.
4. Or, give up and press 'h' check for the solutions.
5. The program will check if your solution is correct and count your score accordingly.

### Features of the demo case
1. Generation of a problem set: we first generate 50 solvable problems and store them in a global 2D array Q.
2. Implementation of a calculator: we implement a parser and evaluator for infix expressions to handle user's input:
  * For the calculator, we implement two stacks using two 1D arrays: the value stack and the opertor stack.
  * We take the user's input as a string containing values (A, 2 ~ 10, J, Q, K) and operators '(',')' < '+','-' < '\*', '\\'.
  * The input will be scaned once, and the values and operators will be pushed into stacks accordingly.
  * For operators, if the operator stack is empty, or contains only a '(', or the current operator has a higher precedence than the one on stack top, then the operator will be pushed onto the stack.
  * otherwise, the top of the two stacks will be computed until a ')' is met or the above conditions is not satisfied.
  * when the scanning finishes, the remaining part of the two stack will be computed.
  * the last number in the value stack is the result.
3. Implementation of Stack operations: push, pop, peek using 1D array.
4. Implementation of a function to generate the 24 points solutions: used when the user asks for help and when to generate the problem set.
5. Usage of global and local variables: eg. the problem set is defined globally, which requires reading and writing operations at differnet places of the program.
6. String implemented as char arrays: eg. string ALLTYPE and ALLOP are treat as char arrays.
7. Access global varaible in function. e.g. checkAns().
8. Pass array as function parameters: fetchQ() takes a 2d array as parameter, the array is passed by reference.
