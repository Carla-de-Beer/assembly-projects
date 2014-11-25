// Carla de Beer

// Assembly program, called via C, that reads and outputs the data contained inside a .txt file,
// based on the file name provided. 

// Date created: 31/10/2014

#include <stdio.h>

extern void reader();

int main()
{	
	printf("%s\n", "Enter the filename of the content you wish to read and display: ");  
	reader();
	return 0;
}
