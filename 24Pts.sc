// declaration and defination of some global variable
QUELIMIT = 99;
array questionBase[99][4]; 
// string will be dealed as char array
array ALLTYPE[13] = "A234567890JQK";
array ALLOP[4] = "+-*/";
coun = 0;
qNo = 0;

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

precedence(c){ // compute the precedence of an operator
  if (c=='(' || c==')')
    return 0;
  if (c=='+' || c=='-')
    return 1;
  if (c=='*' || c=='/')
    return 2;
}

compute(ope1, ope2, op){
  if(op == '+')
    return ope2 + ope1;
  else if(op == '-')
    return ope2 - ope1;
  else if(op == '*')
    return ope2 * ope1;
  else if(op == '/')
    return ope2 / ope1;        
  else 
    return -99999;
}

push(stack, ptr, content){
  stack[ptr]=content;
  ptr=ptr+1;
  return ptr;
}

pop(stack, ptr){
  ptr=ptr-1;
  stack[ptr]=-99999;
  return ptr;
}

peek(stack, ptr){
  return stack[ptr-1];
}

evaluate(input){
  array oprStack[50];
  array valStack[50];
  oprPtr=0;
  valPtr=0;
  strPtr=0;
  while(input[strPtr] != 'e'){
    c=input[strPtr];
    if (c=='A'|| c=='2'|| c=='3'|| c=='4'|| c=='5'|| c=='6'|| c=='7'|| c=='8'|| c=='9'|| c=='0'|| c=='J'|| c=='Q'|| c=='K'){
      valPtr=push(valStack, valPtr, valueOf(c));
    }
    if (c=='(')
      oprPtr=push(oprStack, oprPtr, c);
    if (c=='+' || c=='-' || c=='*' || c=='/'){
      if (oprPtr==0)
        oprPtr=push(oprStack, oprPtr, c);
      else if (precedence(c) > precedence(peek(oprStack, oprPtr)))
        oprPtr=push(oprStack, oprPtr, c);
      else{
        while(oprPtr > 0 && precedence(c) <= precedence(peek(oprStack, oprPtr))){
          ope1=peek(valStack, valPtr);
          valPtr=pop(valStack, valPtr);
          ope2=peek(valStack, valPtr);
          valPtr=pop(valStack, valPtr);
          op=peek(oprStack, oprPtr);
          oprPtr=pop(oprStack, oprPtr);
          valPtr=push(valStack, valPtr, compute(ope1, ope2, op));
        }
        oprPtr=push(oprStack, oprPtr, c);
      }
    }
    if (c==')'){
      while (peek(oprStack, oprPtr)!='('){
        ope1=peek(valStack, valPtr);
        valPtr=pop(valStack, valPtr);
        ope2=peek(valStack, valPtr);
        valPtr=pop(valStack, valPtr);
        op=peek(oprStack, oprPtr);
        oprPtr=pop(oprStack, oprPtr);
        valPtr=push(valStack, valPtr, compute(ope1, ope2, op));
      }
      oprPtr=pop(oprStack, oprPtr); 
    }
    strPtr=strPtr+1;
  } 

  while (oprPtr>0){
    ope1=peek(valStack, valPtr);
    valPtr=pop(valStack, valPtr);
    ope2=peek(valStack, valPtr);
    valPtr=pop(valStack, valPtr);
    op=peek(oprStack, oprPtr);
    oprPtr=pop(oprStack, oprPtr);
    valPtr=push(valStack, valPtr, compute(ope1, ope2, op));
  }
  res = peek(valStack, valPtr);
  
  return res;
}

// a question base to store the question used for playing

generateBase(){ // function to generate the question base
  solvable=0; // a flag to show whether the four number has a solution
  for (i=0; i<6; i=i+1;){
  for (j=12; j>6; j=j-1;){
  for (p=0; p<6; p=p+1;){
  for (q=12; q>6; q=q-1;){ // for each combination of number
    for (x=0; x<4; x=x+1;){
    for (y=1; y<4; y=y+1;){
    for (z=2; z<4; z=z+1;){
      @coun=@coun+1;
      if (@coun>99)
        break;
      // initInput();
      // change the value of a global variable
      array input[50];
      
      puti_(i);
      puti_(j);
      puti_(p);
      puti_(q);
      puti_(x);
      puti_(y);
      puti(z);
      evaluate(input);
    }
    if (@coun>99)
      break;
    }
    if (@coun>99)
      break;
    }
    if (@coun>99)
      break;
  }
  if (@coun>99)
    break;
  }
  if (@coun>99)
    break;
  }
  if (@coun>99)
    break;
  }
}

generateBase();


