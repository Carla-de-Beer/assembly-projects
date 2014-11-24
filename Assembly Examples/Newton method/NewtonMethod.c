/* Assembly function, called via C, that employs the Newton Raphson method to approximate 
 * the root of a polynomial function of the form:
 * ax^6 + bx^5 + cx^4 + dx^3 + ex^3 + fx^2 + gx + h. */

#include <stdio.h>

extern double newton(float a, float b, float c, float d, float e, float f, float g);

int main()
{
	double ans = -10.00;
	ans = newton(0.00,0.00,0.00,1.00,0.00,-2.0,-5.00); //2.0945514815
	//ans = newton(0.00,0.00,0.00,1.00,0.00,-1.0,-1.00); //1.3247179572
	//ans = newton(1.00,0.00,-3.00,1.00,-1.00,0.0,-1.00); //Error: no convergence.-nan 
	//=> division by zero because deriviative has no constants
	//ans = newton(1.00,-1.00,-6.00,0.00,-1.00,1.0,10.00); //-1.9382288347
	//ans = newton(0.00,1.00,-3.00,1.00,-1.00,-1.0,6.00); //2.7055120932
	//ans = newton(0.00,0.00,0.00,0.00,0.00,0.00,0.00);//Error: no convergence.-nan 
	// => division by zero because deriviative has no constants
	printf("%.10f\n",ans);	
	return 0;
}
