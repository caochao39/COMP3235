// declaration and defination of some global variable
QUELIMIT = 50;
c='s';
array Q[50][4];
// string will be dealed as char array
array ALLTYPE[13] = "A234567890JQK";
array ALLOP[4] = "+-*/";
array currQ[4];
coun = 0;
score = 0;
qNo = 0;
array input[20]='e'; // string is initialized with all 'e' characters

iniInput(){
  for (i=0; i<20; i=i+1;){
    @input[i]='e';
  }
}

printInput(){
  for (i=0; i<20; i=i+1;){
    putc_(@input[i]);
  }
  putc('');
}

valueOf(c){ // convert a char to an int value
  if (c == 'A')
    return 1;
  if (c == '2')
    return 2;
  if (c == '3')
    return 3;
  if (c == '4')
    return 4;
  if (c == '5')
    return 5;
  if (c == '6')
    return 6;
  if (c == '7')
    return 7;
  if (c == '8')
    return 8;
  if (c == '9')
    return 9;
  if (c == '0')
    return 10;
  if (c == 'J')
    return 11;
  if (c == 'Q')
    return 12;
  if (c == 'K')
    return 13;
}

valToChar(val){ // input is the value of the card, this function will change it to the card type
  a=@ALLTYPE[val-1]; // string is deal with as char array
  return a;
}

valOp(c){ // value of the operators
  if (c=='+')
    return 0;
  if (c=='-')
    return 1;
  if (c=='*')
    return 2;
  if (c=='/')
    return 3;
}

precedence(c){ // compute the precedence of an operator
  if (c=='(' || c==')')
    return 0;
  if (c=='+' || c=='-')
    return 1;
  if (c=='*' || c=='/')
    return 2;
}

push(stack, ptr, content){ // stack push
  stack[ptr]=content;
  ptr=ptr+1;
  return ptr;
}

pop(stack, ptr){ // stack pop
  ptr=ptr-1;
  stack[ptr]=-99999;
  return ptr;
}

peek(stack, ptr){ // stack peek
  return stack[ptr-1];
}

evaluate(){ // function to evaluate an infix expression
  // two stacks to deal with operator and value separately
  array oprStack[50];
  array valStack[50];
  // two pointer for the two stack
  oprPtr=0;
  valPtr=0;
  // runner of the string
  strPtr=0;
  while(1){ // while the end of string is not met
    c=@input[strPtr];
    if (c=='e')
      break;
    if (c=='A'|| c=='2'|| c=='3'|| c=='4'|| c=='5'|| c=='6'|| c=='7'|| c=='8'|| c=='9'|| c=='0'|| c=='J'|| c=='Q'|| c=='K'){ // if it is a value
      valPtr=push(valStack, valPtr, valueOf(c));
    }
    if (c=='(') // if it is a (, push it onto the operator stack
      oprPtr=push(oprStack, oprPtr, c);
    if (c=='+' || c=='-' || c=='*' || c=='/'){
      if (oprPtr==0) // when the current operator stack is empty
        oprPtr=push(oprStack, oprPtr, c);
      else if (precedence(c) > precedence(peek(oprStack, oprPtr)))
        // when current operator has higher precedence
        oprPtr=push(oprStack, oprPtr, c);
      else{ // when the operator in the stack has higher precedence
        while(oprPtr > 0 && precedence(c) <= precedence(peek(oprStack, oprPtr))){
          ope1=peek(valStack, valPtr);
          valPtr=pop(valStack, valPtr);
          ope2=peek(valStack, valPtr);
          valPtr=pop(valStack, valPtr);
          op=peek(oprStack, oprPtr);
          oprPtr=pop(oprStack, oprPtr);
          valPtr=push(valStack, valPtr, compute(ope2, ope1, valOp(op)));
        }
        oprPtr=push(oprStack, oprPtr, c);
      }
    }
    if (c==')'){ // compute the expression between ( and )
      while (peek(oprStack, oprPtr)!='('){
        ope1=peek(valStack, valPtr);
        valPtr=pop(valStack, valPtr);
        ope2=peek(valStack, valPtr);
        valPtr=pop(valStack, valPtr);
        op=peek(oprStack, oprPtr);
        oprPtr=pop(oprStack, oprPtr);
        valPtr=push(valStack, valPtr, compute(ope2, ope1, valOp(op)));
      }
      oprPtr=pop(oprStack, oprPtr);
    }

    strPtr=strPtr+1;
  }

  while (oprPtr>0){ // final computation
    ope1=peek(valStack, valPtr);
    valPtr=pop(valStack, valPtr);
    ope2=peek(valStack, valPtr);
    valPtr=pop(valStack, valPtr);
    op=peek(oprStack, oprPtr);
    oprPtr=pop(oprStack, oprPtr);
    valPtr=push(valStack, valPtr, compute(ope2, ope1, valOp(op)));
  }
  // the result is the last element in the value stack
  res = peek(valStack, valPtr);

  return res;
}


compute(x, y, op) // function for a single computation, 2 operand and 1 operator
{
  if(op == 0)
  {
    return x + y;
  }
  else if(op == 1)
  {
    return x - y;
  }
  else if(op == 2)
  {
    return x * y;
  }
  else if(op == 3)
  {
    if(y == 0)
    {
      return 0;
    }
    else
    {
      return x / y;
    }
  }
  else
  {
    return 0;
  }

}

// cal1~5 are 5 kinds of computation order of the 4 numbers
cal1(n1, n2, n3, n4, op1, op2, op3)
{
  r1 = compute(n1, n2, op1);
  r2 = compute(r1, n3, op2);
  r3 = compute(r2, n4, op3);
  return r3;
}

cal2(n1, n2, n3, n4, op1, op2, op3)
{
  r1 = compute(n2, n3, op2);
  r2 = compute(n1, r1, op1);
  r3 = compute(r2, n4, op3);
  return r3;
}

cal3(n1, n2, n3, n4, op1, op2, op3)
{
  r1 = compute(n3, n4, op3);
  r2 = compute(n2, r1, op2);
  r3 = compute(n1, r2, op1);
  return r3;
}

cal4(n1, n2, n3, n4, op1, op2, op3)
{
  r1 = compute(n2, n3, op2);
  r2 = compute(r1, n4, op3);
  r3 = compute(n1, r2, op1);
  return r3;
}

cal5(n1, n2, n3, n4, op1, op2, op3)
{
  r1 = compute(n1, n2, op1);
  r2 = compute(n3, n4, op3);
  r3 = compute(r1, r2, op2);
  return r3;
}

getOp(op) // get the operator from its value
{
  if(op == 0)
  {
    return '+';
  }
  else if(op == 1)
  {
    return '-';
  }
  else if(op == 2)
  {
    return '*';
  }
  else if(op == 3)
  {
    return '/';
  }
  else
  {
    return '';
  }
}

getResult(n1, n2, n3, n4) // generate the solution for the combination of 4 numbers
{
  for(op1 = 0; op1 < 4; op1 = op1 + 1;)
  {
    for(op2 = 0; op2 < 4; op2 = op2 + 1;)
    {
      for(op3 = 0; op3 < 4; op3 = op3 + 1;)
      {
        if(cal1(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          putc_('(');
          putc_('(');
          putc_(valToChar(n1));
          putc_(getOp(op1));
          putc_(valToChar(n2));
          putc_(')');
          putc_(getOp(op2));
          putc_(valToChar(n3));
          putc_(')');
          putc_(getOp(op3));
          putc(valToChar(n4));
        }
        if(cal2(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          putc_('(');
          putc_(valToChar(n1));
          putc_(getOp(op1));
          putc_('(');
          putc_(valToChar(n2));
          putc_(getOp(op2));
          putc_(valToChar(n3));
          putc_(')');
          putc_(')');
          putc_(getOp(op3));
          putc(valToChar(n4));
        }
        if(cal3(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          putc_(valToChar(n1));
          putc_(getOp(op1));
          putc_('(');
          putc_(valToChar(n2));
          putc_(getOp(op2));
          putc_('(');
          putc_(valToChar(n3));
          putc_(getOp(op3));
          putc_(valToChar(n4));
          putc_(')');
          putc(')');
        }
        if(cal4(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          putc_(valToChar(n1));
          putc_(getOp(op1));
          putc_('(');
          putc_('(');
          putc_(valToChar(n2));
          putc_(getOp(op2));
          putc_(valToChar(n3));
          putc_(')');
          putc_(getOp(op3));
          putc_(valToChar(n4));
          putc(')');
        }
        if(cal5(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          putc_('(');
          putc_(valToChar(n1));
          putc_(getOp(op1));
          putc_(valToChar(n2));
          putc_(')');
          putc_(getOp(op2));
          putc_('(');
          putc_(valToChar(n3));
          putc_(getOp(op3));
          putc_(valToChar(n4));
          putc(')');
        }
      }
    }
  }
}


check(n1, n2, n3, n4) // function to check whether the four numbers are solvable for 24 points
{
  for(op1 = 0; op1 < 4; op1 = op1 + 1;)
  {
    for(op2 = 0; op2 < 4; op2 = op2 + 1;)
    {
      for(op3 = 0; op3 < 4; op3 = op3 + 1;)
      {
        if(cal1(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          return 1;
        }
        if(cal2(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          return 1;
        }
        if(cal3(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          return 1;
        }
        if(cal4(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          return 1;
        }
        if(cal5(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          return 1;
        }
      }
    }
  }
  return 0;
}

fetchQ(idx, array qb[50][4]){ // fetch a question from the question base with a given index
  @currQ[0] = qb[idx][0];
  @currQ[1] = qb[idx][1];
  @currQ[2] = qb[idx][2];
  @currQ[3] = qb[idx][3];
}

genQ() // function to generate a question base, used when game initialize.
{
  count = 0;
  for(n1 = 1; n1 < 14; n1 = n1 + 1;)
  {
    for(n2 = 1; n2 < 14; n2 = n2 + 1;)
    {
      for(n3 = 1; n3 < 14; n3 = n3 + 1;)
      {
        for(n4 = 1; n4 < 14; n4 = n4 + 1;)
        {
          if(n1 == n2 || n2 == n3 || n3 == n4 || n1 == n3 || n1 == n4 || n2 == n4)
          {
            continue;
          }
          if(check(n1, n2, n3, n4) == 1)
          {
            @Q[count][0] = n1;
            @Q[count][1] = n2;
            @Q[count][2] = n3;
            @Q[count][3] = n4;
            count = count + 1;
            if(count >= @QUELIMIT)
            {
              return 0;
            }
          }
        }
      }
    }
  }
}

printQ() // function to print the current question base
{
  for(i = 0; i < @QUELIMIT; i = i + 1;)
  {
    for(j = 0; j < 4; j = j + 1;)
    {
      puti_(@Q[i][j]);
      putc_(' ');
    }
    putc(' ');
  }
}



checkAns() // function to check whether the answer is a valid one, i.e. Q+Q is 24 but not correct
{ 
  checker=0;
  for (i=0; i<20; i=i+1;){
    for (j=0; j<4; j=j+1;){
      if (valToChar(@currQ[j]) == @input[i])
        checker=checker+1;
    }
  }
  if (checker == 4)
    return 1; 
  else
    return 0;
}


//==========================================//
//                                          //
// following is the main logic of the game  //
//                                          //
//==========================================//
//getResult(1,2,3,4);
genQ(); // before start, generate the question base
while(1){
  puts("please press 's' to start and any other key to exit:");
  getc(cmd);
  if (cmd != 's') // exit of the game
    break;
  puts_("please input question no (0~49): ");
  geti(no);
  while (no>49 || no<0){
    puts_("Sorry, please input a valid question no (0~49): ");
    geti(no);   
  }
  fetchQ(no, Q); // fetch the question with number no

  // print the question
  puts("==========================");
  //puts_("|");
  putc_(valToChar(currQ[0]));
  putc_('\t');
  putc_(valToChar(currQ[1]));
  putc_('\t');
  putc_(valToChar(currQ[2]));
  putc_('\t');
  putc(valToChar(currQ[3]));
  //puts("|");
  puts("==========================");

  puts("[please notice: 0 represents 10]\n");

  puts("Please input your calculation, or press 'h' to checkout the solutions.");
  puts("[Please use 'A', '0', 'J', 'Q', 'K' to denote 1, 10, 11, 12, 13]");
  puts("[You can use '+', '-', '*', '/' and '()' for calculation]");
  puts("[Press Enter to submit.]");
  // gets(ans);

  strRun = 1;
  val = 1;
  iniInput();
  input[0]='(';
  getc(cmd);
  while (cmd != '\n'){
    input[strRun] = @cmd;
    strRun=strRun+1;
    getc(cmd);
  }
  
  input[strRun]=')';
  //TODO: use the user input answer to evaluate;
  if (input[1] == 'h' || val == 0){
    puts("This problem can be solved as: ");
    getResult(currQ[0], currQ[1], currQ[2], currQ[3]);
  }else{
    puts("computation result: ");
    res = evaluate();
    puti(res);
    if (res == 24 && checkAns() == 1){
      puts("Congradulations!");
      score=score+1;
      puts_("Your current score: ");
      puti(score);
    } else if (res != 24){
      puts("Sorry, the answer is not corret.");
      puts_("Your current score: ");
      puti(score);
    } else if (checkAns() == 0){
      puts("Sorry, the answer is not valid for the current question.");
      puts_("Your current score: ");
      puti(score);
    }
  }
}
