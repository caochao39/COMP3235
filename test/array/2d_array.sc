array arr1[2][2];
arr1[1][0] = 9;
puti(arr1[1][0]);

func(x, y)
{
  array @arr2[2][3];
  @arr2[1][1] = 3;
  puti(x + @arr2[1][1]);
}

func(5, 1);
