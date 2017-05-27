fib(x) {
	if (x == 0 || x == 1) return 1;
	return fib(x-1) + fib(x-2);
}

puts("Fibonacci - Please input a number: ");
geti(x);
puti(fib(x));
