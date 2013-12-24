#include <iostream>
#include <cstdio>
using namespace std;
#define le_to_be(x) (((x<<24) & 0xFF000000) | ((x<<8) & 0x00FF0000) | ((x>>8) & 0x0000FF00) | ((x>>24) & 0x000000FF))
int
main()
{
  int x= 0x12345678;
  printf("\n le %x be %x \n", x , le_to_be(x));
  return 0;
}
