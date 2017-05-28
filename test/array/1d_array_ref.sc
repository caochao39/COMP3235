array x[3];
aaa(a, x, y, z)
{
  a[0] = x;
  bbb(a, y, z);
}

bbb(b, y, z)
{
  b[1] = y;
  puti(b[0]);
  ccc(b, z);
}

ccc(c, z)
{
  c[2] = z;
  puti(c[1]);
}

aaa(x, 111, 222, 333);
puti(x[2]);
