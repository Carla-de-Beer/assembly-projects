// Carla de Beer

// Assembly function, called via this C-function, the decrypts a given encrypted file
// by following the reverse of the encryption method provided in "File encryption".

// Date created: 13/10/2014

#include <stdio.h>

extern void decrypt(char *secret);

int main()
{	
	char secret[] = "secret.txt";
	decrypt(secret);
	return 0;
}
