/* Program that calculates the determinant for a 2x2 or 3x3 matrix.
 * Input greater than this is reported as an error.
 * Input both a matrix array and matrix size. */

#include <stdio.h>

extern int det(int *array,int N);

int main()
{
    int n = 3;
    
    	//int array[1] = {-15};
    
	//int array[4] = {3, 5, -2, 1}; //13
	//int array[4] = {31, 15, -28, 5}; //575
	//int array[4] = {3, 4, -2, 3}; //17
    
	//int array[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9}; //0
	int array[9] = {4, 3, 5, -1, 4, -3, 6, 7, 8}; //27
	//int array[9] = {0, 0, 0, 0, 0, 0, 0, 0, 0};
	//int array[9] = {13, 5, 3, -4, 12, 30, 17, -9, 0}; //5556
	//int array[9] = {5, -3, 2, 1, 0, 2, 2, -1, 3}; //5
	//int array[9] = {1, 1, 1, 1, 14, 3, 4, -4, 6}; //42
    
	// int array[16] = {2, -33, 0, 1, 5, 44, 2, 0, 1, -1, 0, 3, -2, 11, 0, 0};
	//int array[16] = {0, 2, 0, 0, -3, 0, 0, 0, 0, 0, 0, 4, 0, 0, 1, 0};
	//int array[16] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
	
	int ans = 0;
	int i = 0;
	for(i = 0; i<n*n;i++) 
	{
		printf("%d ",array[i]);
		if((i+1)%n == 0) printf("\n");
	}
	ans = det(array,n);
	printf("%d\n",ans);
	return 0;
}