#include <iostream>
using namespace std;
int a[4][4];

#define dump_arr(a,n) \
{ \
  for(int i= 0; i < n;i++) \
  { \
    for(int j= 0; j < n; j++) \
    { \
      cout<<a[i][j]<<"  "; \
    } \
    cout<<endl; \
  } \
} \

int
main(int argc, char** argv)
{
  int n;
  //cin>>n;
  n= 4;
  int i,j;
  int num= 1;
  int seg_len= n;

  int top_left= 0;
  int top_right= top_left+seg_len-1;
  int bottom_right= top_left+seg_len-1;
  int bottom_left= top_left;
  int iter= 0;

  while (num <= 15)
  {
    for(i= top_left; i <= top_right; i++)
    {
      a[top_left][i]= num++;
      cout<<"Setting top_left ("<<top_left<<" , "<<i<<" )"<<a[top_left][i]<<endl;
    }
    dump_arr(a,4);cout<<endl;

    for (i= top_left+1;i<=bottom_right;i++)
    {
      a[i][top_right]= num++;
      cout<<"Setting top_right ("<<i<<" , "<<top_right<<" ) "<< a[i][top_right]<<endl;
    }
    dump_arr(a,4);cout<<endl;

    for (i= bottom_right-1; i>= bottom_left;i--)
    {
      a[bottom_right][i]= num++;
      cout<<"Setting bottom_right ("<<bottom_right<<" , "<<i<< " ) "<<a[bottom_right][i]<<endl;
    }
    for(i= bottom_right-1;i>=(top_left+1);i--)
    {
      a[i][top_left]= num++;
      cout<<"Setting bottom left ("<<bottom_right<<" , "<<i<<" )"<<a[bottom_right][i]<<endl;
    }
    iter--;
    seg_len= n-iter;
    top_left++;
    top_right= top_left+seg_len-1;
    bottom_right= top_left+seg_len-1;
    bottom_left= top_left;
  }
  dump_arr(a,4);cout<<endl;
}
