z=0;
while(z < 10) {
  read a[z];
  z = z + 1;
} 

w = 1; // swapped
while(w==1) {
  w = 0;
  for(z=1; z<10; z=z+1;) {
    if(a[z-1] > a[z]) {
      y = a[z];
      a[z] = a[z-1];
      a[z-1] = y;
      w = 1;
    }
  }
}

for(z=0; z<10; z=z+1;) {
  print a[z];
}

