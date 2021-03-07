/*
 * Description
 *     Input the string, and split it by 8 bytes.
 *
 * Author: LuoJia
 * e-mail:luojia0309@outlook.com
 * Data: 2021-03-07
 *
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <signal.h>

#define N 1024  // The max length of input

char* str1;

void sigroutine(int signo)
{
	if (str1)
		free(str1);
	printf("memory has been released\n");

}

//get the input, if input '#', the process will exit()
int input_str(char* str)
{
	printf("Please input the string\n");
	scanf_s("%s", str, N);

#if 0
	if (str[0] == '#')
	{
		printf("no input\n");
		return -1;
	}
#endif // 0
	return 0;
}

//print the str as 8 chars a line
int print_str(char* str)
{
	int length = strlen(str);
	char tmp[9] = { 0 };
	int i;

	if (length <= 8)	//if the length of str is sorter than 8, print it directly.
	{
		printf("%s\n", str);
	}
	else				//if the length of str is longger that 8,
	{
		for (i = 0; i < length ; i+=8)
		{
			for (int j = 0; j < 8 && ((i+j) < length); j++)
			{
				tmp[j] = str[i + j];
			}
			tmp[8] = '\0';
			printf("%s\n", tmp);
			memset(tmp, '\0', 9);
		}
	}

	return 0;
}

int main(int argc, char** argv)
{
	signal(SIGINT, sigroutine);

	if ((str1 = (char*)malloc(N)) == NULL)
	{
		printf("Can not malloc the memory!\n");
		return -1;
	}

	while (!input_str(str1))
	{
		print_str(str1);
	}

	free(str1);
//	printf("memory has been released\n");
	return 0;
}