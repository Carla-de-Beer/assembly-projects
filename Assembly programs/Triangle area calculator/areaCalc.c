// Carla de Beer

// Assembly program, called via C, that calculates the area of a triangle 
// based on a set of three 2D input coordinates.

// Date created: 09/10/2014

#include <stdio.h>

extern float area(float x1, float y1, float x2, float y2, float x3, float y3);

int main()
{
	float ans = -10;
	ans = area(3.00,5.00,4.00,0.00,1.00,2.00);  	//6.5000000000
	//ans = area(0.00,0.00,5.00,0.00,5.00,12.00);  	//30.0000000000
	//ans = area(0.00,0.00,3.00,0.00,3.00,4.00);  	//6.0000000000
	//ans = area(0.01,0.07,3.03,0.02,3.08,4.01);    //6.0261502266
	printf("%.10f\n",ans);	
	return 0;
}
