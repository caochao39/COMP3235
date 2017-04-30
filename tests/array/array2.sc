a = 10;
f(b)
{
  @a = 1;
  c = 2;
  array @arr1[4];
  @arr1[1] = 4;
  return @a + b + c + @arr1[1];
}
puti(f(a));
