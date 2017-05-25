array a[1][2][3];
a[0][1][2] = "aaa";
puts(a[0][1][2]);
aaa(array x[1][2][3])
{
  x[0][1][2] = "bbbb";
  puts(x[0][1][2]);
  bbb(x);
  puts(x[0][1][2]);
}

bbb(array y[1][2][3])
{
  y[0][1][2] = "ccc";
}

aaa(a);
puts(a[0][1][2]);
