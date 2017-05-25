aaa(a,b,c){
  array y[3];
  y[0] = a;
  y[1] = b;
  bbb(y,c);
}


bbb(x,c){
  x[2] = c;
  puti(x[0]);
  puti(x[1]);
  puti(x[2]);
}

aaa(1,2,3);
