aaa(){
  array a[2][2];
  a[0][0]=1111;
  a[0][1]=2222;
  a[1][0]=3333;
  a[1][1]=4444;
  puti(a[0][0]);
  puti(a[0][1]);
  puti(a[1][0]);
  puti(a[1][1]);
  bbb(a);
}

bbb(array n[2][2]){
  n[1][1] = 5555;
  
  puti(n[0][0]);
  puti(n[0][1]);
  puti(n[1][0]);
  puti(n[1][1]);
  ccc(n);
}

ccc(array n[2][2]){
  n[0][0] = 6666;

  puti(n[0][0]);
  puti(n[0][1]);
  puti(n[1][0]);
  puti(n[1][1]);
  return 0;
}

aaa();


