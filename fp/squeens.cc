#include <iostream>
#include <cstdlib>
#include <cmath>
using namespace std;

#define LEN(arr) sizeof(arr)/sizeof(arr[0])

bool isValid(int *cpos,int npos)
{
  for (int i=0; i < npos; i++)
  {
    if (cpos[i] == cpos[npos]) return false;
    if ((cpos[i]-cpos[npos]) == (npos-i)) return false;
    if ((cpos[npos]-cpos[i]) == (npos-i)) return false;
    if (abs((cpos[npos]-cpos[i])) == 1 && (npos-i) == 2) return false;
    if (abs((cpos[npos]-cpos[i])) == 2 && (npos-i) == 1) return false;
  }
  return true;
}

int
squeens(int *cpos, int row, int n)
{
  if ( row==n)
    return 1;
  int count= 0;
  for(int c=0;c < n; c++)
  {
    cpos[row]=c;
    if (isValid(cpos,row))
    {
      count+=squeens(cpos,row+1,n);
    }
  }
  return count;

}
int
main(int argc, char** argv)
{
  int* cpos;
  int n;

  cin>>n;
  cpos= (int*) malloc(n*sizeof(cpos));
  cout<<squeens(cpos,0,n)<<endl;
  free(cpos);
  return 0;
}
