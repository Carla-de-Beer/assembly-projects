#include <stdio.h>

extern int prime(int number);

int main()
{
	int isPrime = prime(7919);
	//if(isPrime) printf("%d is prime!\n",isPrime);
	//else printf("%d is not prime!\n",isPrime);
	return 0;
}
