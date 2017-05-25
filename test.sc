array arr1[3];
func(x, x0)
{
  x[0]=x0;
  func2(x, x0*2);
}

func2(x, x1){
  x[1]=x1;
}

func(arr1, 2);

puti(arr1[0]);
puti(arr1[1]);
