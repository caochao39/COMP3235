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
  while(input[strPtr]!='\0'){
    c=input[strPtr];
  
    if (c=='A'|| c=='2'|| c=='3'|| c=='4'|| c=='5'|| c=='6'|| c=='7'|| c=='8'|| c=='9'|| c=='0'|| c=='J'|| c=='Q'|| c=='K')
      valPtr=push(valStack, valPtr, valueOf(c));
    if (c=='(')
      oprPtr=push(oprStack, oprPtr, c);
    if (c=='+' || c=='-' || c=='*' || c=='/'){
      puti(c);
      if (oprPtr==0)
        oprPtr=push(oprStack, oprPtr, c);
      else if (precedence(c) > precedence(peek(oprStack, oprPtr)))
        oprPtr=push(oprStack, oprPtr, c);
      else{
        while(oprPtr > 0 && precedence(c) <= precedence(peek(oprStack, oprPtr))){
          ope1=peek(valStack);
          valPtr=pop(valStack, valPtr);
          ope2=peek(valStack);
          valPtr=pop(valStack, valPtr);
          op=peek(oprStack);
          oprPtr=pop(oprStack, oprPtr);
          valPtr=push(valStack, valPtr, compute(ope1, ope2, op));
        }
        oprPtr=push(oprStack, oprPtr, c);
      }
    }
    if (c==')'){
      while (peek(oprStack, oprPtr)!='('){
        ope1=peek(valStack);
        valPtr=pop(valStack, valPtr);
        ope2=peek(valStack);
        valPtr=pop(valStack, valPtr);
        op=peek(oprStack);
        oprPtr=pop(oprStack, oprPtr);
        valPtr=push(valStack, valPtr, compute(ope1, ope2, op));
      }
      oprPtr=pop(oprStack, oprPtr);
    }

    strPtr=strPtr+1;
  } 
  while (oprPtr>0){
    ope1=peek(valStack);
    valPtr=pop(valStack, valPtr);
    ope2=peek(valStack);
    valPtr=pop(valStack, valPtr);
    op=peek(oprStack);
    oprPtr=pop(oprStack, oprPtr);
    valPtr=push(valStack, valPtr, compute(ope1, ope2, op));
  }
  res = peek(valStack, valPtr);
  return res;
}

array a[4]="1+2+3";
a[3]='\0';

puti(evaluate(a));
