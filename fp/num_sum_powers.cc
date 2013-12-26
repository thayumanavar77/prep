#include <iostream>
#include <cmath>
using namespace std;

int
ways_sum(int s, int p, int j)
{
//    cout<<" NEW RECURSION "<<"   s " <<s << " j  "<<j<<endl;
    if (s == 0)
    {
      cout<<"   Reached zero "<<endl;
      return 1;
    }

    if (s < 0)
      return 0;

   int count=0;
   int temp=0;
   for (int i=j; i<s;i++) {
        //cout<<" i  pow "<<i<<"   "<<pow(i,p)<<endl;
        temp=ways_sum(s-pow(i,p), p, i+1);
        if (temp == 1)
          cout<<" REACH LEVEL " <<i<<"  " <<endl;
        count+=temp;
   }


    return count;
}
int
main()
{
    int s,p;
    cin>>s>>p;
    cout<<" sum " << s << "   power  "<< p << endl;
    cout<<"WAYS OF SUM "<<ways_sum(s,p,1)<<endl;
    return 0;
}
