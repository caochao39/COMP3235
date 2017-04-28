// FACTORIAL(x)

geti(x);
if (x == 0){
  puti(1);
}
else{
  if (x >= 1 && x <= 12) { // 13! is too much for int
    f = 1;
    while (x > 1) {
      f = f * x;
      x = x - 1;
    }
    puti(f);
  }
}
