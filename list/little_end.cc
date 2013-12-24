#include <iostream>
#include <cstdio>
using namespace std;
#define OFFSET_OF(TYPE, MEMBER)  /*((size_t)*/ (&(((TYPE*)0)->MEMBER))//)
struct C{
  int a;
  char b;
};
int
main()
{
  int x= 1;
  printf("\n %p \n", OFFSET_OF(C, b));
 // cout<<OFFSET_OF(C,b)<<endl;

  if ((*((char*)&x)) == 1)
    cout<<" LE "<<endl;
  else
    cout<<" BE "<<endl;
  return 0;
}
