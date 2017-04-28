puts_("Please enter an int <= 12: ");

geti(n);

fact(n){
  if (n<1)
    return 1;
  return n * fact(n-1);
}

if(n<=12){
  puti(fact(n));
} else {
  puti_(n); puts(" >> 12!!");
}
