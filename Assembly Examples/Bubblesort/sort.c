// Carla de Beer
// Assembly language function, called via this C-function, that implements a bubble sort algorithm
// Date created: 09/10/2014

#include <stdio.h>

int main()
{
	int size = 10;

	int array[10] = {9, 8, 7, 6, 5, 4, 3, 2 , 11, 0};
	
	bsort(array,size);
	int i = 0;
	
	for(i = 0; i < size; ++i) 
	{
		printf("%d ",array[i]);
	}
	printf("\n");
	return 0;
}
