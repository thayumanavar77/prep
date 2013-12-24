#include <iostream>
using namespace std;

int
main(int argc, char** argv)
{
  unsigned long long prod, n, n1, data;
  cin>>n;

  for(int i= 0; i<n; i++)
  {
    cin>>n1;
    prod= 1;
    for(int j=0;j<n1-1;j++)
    {
      cin>>data;
      prod = (prod * data)%1234567;
    }
    cout<<prod<<endl;
  }
  return 0;
}
