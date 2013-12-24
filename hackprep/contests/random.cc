#include <iostream>
using namespace std;
long double d[1005];
long double pmat[1005][1005];
int
main(int argc, char** argv)
{
  cin>>n>>a>>n;
  for (int i= 0; i<n;i++)
    cin>>d[i];

  long double punchanged= ((long double))(n-2)/(n);
  long double pswap= ((long double))(2)/(n*(n-1));

  // If we do random swap of k times, calculate the following probabilities
  // the probability that the element stays in the same position and the
  // probabilities element changes position.

  // P(k) - probability that the element changes position after k swaps.
  // P1(k) - probability that the element remains in same position after
  // k swaps.
   P(k) = (1-p1(k))/n-1 
   (n-1)*P(0,1,k) + P(0,0,k) = 1
   = after single operation = 2/(n*(n-1));

  return 0;
}
