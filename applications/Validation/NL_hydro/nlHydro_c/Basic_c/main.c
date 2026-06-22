#include <stdio.h>
#include "helloWorld.h"

int main() {

   int p = 10, q = 20;
   double x = 5.25;

   sayHello();
   printf("sum of %d and %d is %d\n", p, q, add(p,q));
   printf("Radius: %lf Area: %lf", x, area(x));

   return 0;
}