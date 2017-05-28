array x[3];
aaa(a){
  a[0]=0;
  bbb(a);
}
bbb(b){
  b[1]=1;
  ccc(b);
}
ccc(c){
  c[2]=2;
}

aaa(x);
puti(x[0]);
puti(x[1]);
puti(x[2]);

