#include <iostream>
#include <vector>
using namespace std;
#define R 32
#define C 63
void
outputarr(vector< vector<char> >& arr, int r,int c)
{
  for (int i= 0; i < r; i++) {
    for (int j= 0; j < c; j++)
      cout<<arr[i][j];
    cout<<endl;
  }
}
void
createTri(vector < vector<char> >&arr, int sr, int s, int p)
{
 // int e= sr+s;
  for (int i= 0; i < s;i++) {
    for (int j= p-i; j <= p+i+1;j++)
      arr[i+sr][j]=1;
  }


}
void
sierpinski(vector < vector<char> >&arr, int sr, int s,int p)
{

  if ( s==8) {
    createTri(arr,sr,s,p);
    return;
  }
  sierpinski(arr,sr, s/2,p);
  sierpinski(arr, sr+s/2,s/2,p-s/2);
  sierpinski(arr, sr+s/2,s/2,p+s/2);
//  sierpinski(arr, s/2, p); sierpinski(arr, s/2, p-s/2); sierpinski(arr, s/2,
//  p-s/2+1);
}
int
main()
{
  vector< vector<char> > tri(R);
  for (int i= 0; i < R; i++)
    for (int j= 0; j < C; j++)
      tri[i].push_back('_');

  outputarr(tri, R, C);
  cout<<" Creating a sierpinski triangle "<<endl;
  //createTri(tri, R, C);
  sierpinski(tri, 0, R, C/2);
  outputarr(tri, R, C);
  return 0;
}
