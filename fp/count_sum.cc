#include <iostream>

using namespace std;
int
fsum(int s,int n)
{
  if (s==0)
    return 1;
  if (s!=0 &&  n==0)
    return 0;
  int ways=0;
  for(int i=0;i<=s;i++)
    ways+=fsum(s-i,n-1);
  return ways;
}
int
main(int argc,char** argv)
{
  cout<<fsum(15,5)<<endl;
  return 0;
}
