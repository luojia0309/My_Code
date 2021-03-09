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

#define NUM 5

int prime[1000] = {0}; //used to store the prime
int all = 0;

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
	//printf("%d is prime\n", n);
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
	all = k - 1;

	// output all the prime found
	printf("all the %d prime number between 2 and %d:\n", all, n);
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
	int tmp = 0;

	r = (int *)malloc(number*sizeof(int));  // 10^r = pn

	for (size_t i = 0; i < number; i++)
	{
		r[i] = (int)log10(p[i]) + 1;
	}

	for (size_t i = 0; i < number; i++)
	{
		for (size_t j = 0; j < number; j++)
		{
			if (i == j)
				continue;
			//printf("p[%d] = %d  p[%d] = %d  r[%d] = %d  number = %d\n", i, p[i], j, p[j], j, r[i], number);
			tmp = p[i] + p[j] * pow(10, r[i]);
			//printf("tmp is %d\n", tmp);
			if (!is_prime(tmp))
			{
				free(r);
				return false;
			}
		}
	}

	free(r);
	return true;
}

int print_result(int* arr, int n)
{
	int sum = 0;
	for (size_t i = 0; i < n; i++)
	{
		printf("%d ", arr[i]);
		sum += arr[i];
	}
	printf("\nSum of them is : %d\n\n", sum);

	return 0;
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

	find_out_prime(n);

	int tmp[NUM] = { 0 };


	for (size_t i = 0; i < all; i++)
	{
		tmp[0] = prime[i];
		for (size_t j = i+1; j < all; j++)
		{
			tmp[1] = prime[j];
			for (size_t k = j+1; k < all; k++)
			{
				tmp[2] = prime[k];
				for (size_t l = k+1; l < all; l++)
				{
					tmp[3] = prime[l];
					for (size_t q = l + 1; q < all; q++)
					{
						tmp[4] = prime[q];
						if (is_match(tmp, NUM))
						{
							printf("matched!\n");
							print_result(tmp, NUM);
							return 0;
						}
						else
						{
							//printf("not matcted\n");
						}
					}
				}
			}
		}
	}

/*
	if(is_match(tmp, NUM))
		printf("is match\n");
	else
		printf("is not match\n");
*/

	return 0;
}