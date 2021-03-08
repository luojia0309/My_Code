/*
 * Description
 *     1. Find out the prime number of a known number
 *
 * Author: LuoJia
 * e-mail:luojia0309@outlook.com
 * Data: 2021-03-07
 * 
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

int prime[1000] = {0}; //used to store the prime


// output the prime composition of n
int find_out_the_prime_composition(int n)
{
	for (size_t i = 2; i < n/2; i++)
	{
		// printf("n: %d\n", n);
		if (n%i == 0)
		{
			printf("%d ", i);
			find_out_the_prime_composition(n/i);
			return 0;
		}
	}

	printf("%d \n", n);

	return 0;
}

bool is_prime(int n)
{
	for (size_t i = 2; i <= n / 2 ; i++)
	{
		if (n % i == 0)
		{
			return false;
		}
	}

	return true;
}

// find out the prime between 2 and n
int find_out_prime(int n)
{
	int k = 0;

	for (size_t i = 2; i < n && k < 1000; i++)
	{
		if (!is_prime(i))
			continue;
		prime[k] = i;
		k++;

	}

	// output all the prime found
	for (size_t i = 0; prime[i] && i < 1000; i++)
	{
		printf("%d ", prime[i]);
	}
	printf("\n");

	return 0;
}

/*
* Determine if the five prime numbers meet the condition.
* The new number combined by any two of them is also a prime number.
* Return value
*   true	If they meet the condition.
*   false	If they do not meet the condition.
*/ 
bool is_match(int *p, int number)
{
	int* r;

	r = (int *)malloc(number*sizeof(int));  // 10^r = pn

	for (size_t i = 0; i < number; i++)
	{
		r[i] = (int)log10(p[i]);
	}

	for (size_t i = 0; i < number; i++)
	{
		for (size_t j = 0; j < number; j++)
		{
			if (i = j)
				continue;
			free(r);
			return is_prime(p[i] + p[j] * pow(10, r[j]));
		}
	}

	free(r);
	return true;
}



int main(int argc, char** argv)
{
	int n;

	printf("Please input a int number:\n");
	scanf_s("%d", &n);

	//find_out_the_prime_composition(n);


	if(is_prime(n))
		printf("%d is prime\n", n);
	else
		printf("%d is not prime\n", n);

	printf("all the prime number between 2 and %d:\n", n);
	find_out_prime(n);

	int tmp[4] = {3, 7, 109, 673};

	if(is_match(tmp, 4))
		printf("is match\n");
	else
		printf("is not match\n");


	return 0;
}