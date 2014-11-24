/* Assembly program, called via C, that reads and outputs the data contained inside a .txt file,
 * based on the file name provided. */

#include <stdio.h>

extern void reader();

int main()
{	
	printf("%s\n", "Enter the filename you wish to read and display: ");  
	reader();
	return 0;
}
