add(ax,ay)
{
  ax = 5;
  ay = 1;
}

minus(ax, ay)
{
  return ax - ay;
}

fun1(ax, ay)
{
  add(1, 2);
  a = 1;
  b = 2;
  add(a, b);
  return minus(ax, ay);
}

puti(fun1(3, 4));
