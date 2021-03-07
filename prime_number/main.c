/*
 * Description
 *     Find out the prime number of a known number
 *
 * Author: LuoJia
 * e-mail:luojia0309@outlook.com
 * Data: 2021-03-07
 *
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int find_out_the_peime_composition(int n)
{
	int i;

	for ( i = 2; i < n/2; i++)
	{
		//printf("n: %d\n", n);
		if (n%i == 0)
		{
			printf("%d ", i);
			find_out_the_peime_composition(n/i);
			break;
		}
	}
	if (i == n / 2)
	{
		printf("%d \n", n);
		return 0;
	}

	return 0;
}



int main(int argc, char** argv)
{
	int n;

	scanf_s("%d", &n);

	find_out_the_peime_composition(n);

	return 0;
}