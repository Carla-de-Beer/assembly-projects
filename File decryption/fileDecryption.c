/* Assembly function, called via this C file, the decrypts a given encrypted file
 * by following the reverse of the encryption method provided in "File encryption".
 */

#include <stdio.h>

extern void decrypt(char *secret);

int main()
{	
	char secret[] = "secret.txt";
	decrypt(secret);
	return 0;
}
