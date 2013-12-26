#include <iostream>
#include <vector>
using namespace std;

unsigned long long prev[780];
unsigned long long cur[780];
unsigned long long
score(int n, int *score_arr)
{
  int max_score= n-1;
  long long max_sum= n*(n-1)/2;
  int q=0;
  long long s= max_sum;

  for (int i= 0; i < n; i++)
  {
    if(score_arr[i]==-1)
      q++;
    else
      s-= score_arr[i];
  }
  if ( s<0 ) return 0;
  if ( s==0 ) return 1;
//  cout<<q<<"   "<<s<<endl;
  unsigned long long* prev1= prev;
  unsigned long long* cur1= cur;
  cout<<max_score<<endl;
  cout<<max_sum<<endl;
  for (int i= 0;i<=s;i++)
  {
      if (i <= max_score)
        prev[i]= 1;
      else
        prev[i]= 0;
  }
  for(int i= 1; i<q ;i++)
  {
    unsigned long long m= (n-i)*(n-i-1)/2;
    for(int j= 0; j<=s;j++)
    {
      cur1[j]= 0;
      for (int k= 0; k<= max_score;k++)
          if (j-k>=0)
            cur1[j]+= (prev1[j-k]);
    }
    unsigned long long* temp1= prev1;
    prev1= cur1;
    cur1= temp1;
  }
  cout<<prev1[s-2]<<endl;
  cout<<prev1[s-1]<<endl;
  return prev1[s];
}
int
main(int argc,char** argv)
{
  int t, n;
  int score_arr[40];
  cin>>t;
  for(int i= 0; i < t; i++)
  {
    cin>>n;
    for(int j= 0; j < n; j++)
    {
      cin>>score_arr[j];
    }
    cout<<score(n,score_arr)%1000000007LL<<endl;
  }
  return 0;
}
