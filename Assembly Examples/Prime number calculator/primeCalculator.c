// Carla de Beer
// Assembly function, called via this C-function, that calculates whether a number is prime or not
// Date created: 29/09/2014

#include <stdio.h>

extern int prime(int number);

int main()
{
	int isPrime = prime(7919);
	//if(isPrime) printf("%d is prime!\n",isPrime);
	//else printf("%d is not prime!\n",isPrime);
	return 0;
}
