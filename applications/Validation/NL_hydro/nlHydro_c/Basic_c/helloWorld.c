#include <stdio.h>
#include <string.h>
#include <math.h>

#define PI 3.142

void sayHello(){
   printf("Hello World\n");
}

int add(int a, int b){
   int result;
   result = a+b;
   return result;
}

double area(double radius){
   double areaofcircle = PI*pow(radius, 2);
   return areaofcircle;
}

int length(char *x){
   return strlen(x);
}