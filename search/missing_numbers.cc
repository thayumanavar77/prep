#include <iostream>
#include <map>
using namespace std;
int xl[1000001];
int
main(int argc,char** argv)
{
  int x,y;
  map<int, int> yl;
  map<int,int>::iterator yliter;
  cin>>x;
  for(int i=0;i<x;i++) {
    cin>>xl[i];
  }
  cin>>y;
  int inp;
  for(int j=0;j<y;j++) {
    cin>>inp;
    yliter = yl.find(inp);
    if (yliter == yl.end()) {
      yl.insert(make_pair(inp,1));
    }
    else {
      yliter->second++;
    }
  }

  for(int i=0;i<x;i++) {
    yliter=yl.find(xl[i]);
    if(yliter != yl.end()) {
      yliter->second--;
    }
  }
  for(yliter=yl.begin(); yliter != yl.end();++yliter)
  {
    if (yliter->second!=0)
      cout<<yliter->first<<" ";
  }
  cout<<endl;
  return 0;
}
