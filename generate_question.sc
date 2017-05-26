compute(x, y, op)
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

getOp(op)
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

getResult(n1, n2, n3, n4)
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
          puti_(n1);
          putc_(getOp(op1));
          puti_(n2);
          putc_(')');
          putc_(getOp(op2));
          puti_(n3);
          putc_(')');
          putc_(getOp(op3));
          puti(n4);
        }
        if(cal2(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          putc_('(');
          puti_(n1);
          putc_(getOp(op1));
          putc_('(');
          puti_(n2);
          putc_(getOp(op2));
          puti_(n3);
          putc_(')');
          putc_(')');
          putc_(getOp(op3));
          puti(n4);
        }
        if(cal3(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          puti_(n1);
          putc_(getOp(op1));
          putc_('(');
          puti_(n2);
          putc_(getOp(op2));
          putc_('(');
          puti_(n3);
          putc_(getOp(op3));
          puti_(n4);
          putc_(')');
          putc(')');
        }
        if(cal4(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          puti_(n1);
          putc_(getOp(op1));
          putc_('(');
          putc_('(');
          puti_(n2);
          putc_(getOp(op2));
          puti_(n3);
          putc_(')');
          putc_(getOp(op3));
          puti_(n4);
          putc(')');
        }
        if(cal5(n1, n2, n3, n4, op1, op2, op3) == 24)
        {
          putc_('(');
          puti_(n1);
          putc_(getOp(op1));
          puti_(n2);
          putc_(')');
          putc_(getOp(op2));
          putc_('(');
          puti_(n3);
          putc_(getOp(op3));
          puti_(n4);
          putc(')');
        }
      }
    }
  }
}


check(n1, n2, n3, n4)
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
        return 0;
      }
    }
  }
}

array Q[20][4];

genQ()
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
            if(count > 19)
            {
              return 0;
            }
            puti_(n1);
            putc_(' ');
            puti_(n2);
            putc_(' ');
            puti_(n3);
            putc_(' ');
            puti(n4);
          }
        }
      }
    }
  }
}

genQ();

printQ()
{
  for(i = 0; i < 20; i = i + 1;)
  {
    for(j = 0; j < 4; j = j + 1;)
    {
      puti_(@Q[i][j]);
      putc_(' ');
    }
    putc(' ');
  }
}

printQ();
