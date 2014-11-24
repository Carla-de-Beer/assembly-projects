/* Assembly program, called via C, that reads and encrypts the data contained inside a given .txt file. */

#include <stdio.h>

extern void encrypt(char *public, char *secret);

int main()
{	
	char public[] = "public.txt";
	char secret[] = "secret.txt";
	encrypt(public,secret);
	return 0;
}
