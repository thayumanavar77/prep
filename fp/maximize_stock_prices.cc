#include <iostream>
#include <climits>
#include <algorithm>
#include <vector>


using namespace std;
int
profit_stock(int* n, int d)
{


}
int
main(int argc,char** argv)
{
  int t;
  int d;

  cin>>t;
  for (int i=0; i<t; i++)
  {
      cin>>d;
      vector< int > price;
      for(int j=0;j<d;j++)
      {
        int sp;
        cin>>sp;
        price.push_back(sp);
      }
      vector< vector<int> > best(d, vector<int>(2*d));

      best[0][0]= 0;
      for (int i=1;i<2*d;i++)
      {
        best[0][i]= 0;//INT_MIN;
      }
      for (int i=1;i<d;i++)
      {
        for(int j=0;j<d;j++)
        {
          int maxm=0;
          for (int k=0;k<j;k++)
          {
            int nm= best[i-1][j+k]+k*price[i];
            if (nm > maxm)
              maxm= nm;
            //best[i][j]=  max(best[i-1][j],max(best[i-1][j-1]-price[i],
            //best[i-1][j+1]+price[i]));
          }
          best[i][j]= max(maxm,best[i-1][j-1]-price[i]);
        }
      }
      cout<<best[d-1][0]<<endl;
  }
  return 0;
}
