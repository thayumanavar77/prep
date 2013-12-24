#include <iostream>
using namespace std;
int
count_bit_set(int n)
{
  int count= 0;
  while(n!=0)
  {
    n= n&(n-1);
    count++;
  }
  return count;
}
int
main(int argc,char** argv)
{
  cout<<count_bit_set(7)<<endl;
  cout<<count_bit_set(8)<<endl;
  cout<<count_bit_set(0)<<endl;
  cout<<count_bit_set(17)<<endl;
  return 0;
}
