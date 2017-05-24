array arr1[3];
func(x, x0, x1, x2)
{
  x[0]=x0;
  x[1]=x1;
  x[2]=x2;
}

add(x){
  return x[0] + x[1] + x[2];
}

printAll(x){
  puti(x[0]);
  puti(x[1]);
  puti(x[2]);
}

func(arr1, 2, 4, 6);
printAll(arr1);
puti(add(arr1));
