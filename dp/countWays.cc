#include <stdio.h>
#define LEN(x) sizeof(x)/sizeof(x[0])
int
countChange(int amount, int index, int* coins)
{
    if ( amount < 0 )
      return 0;
    if ( amount == 0 )
      return 1;
    if (index < 0)
      return 0;
    return countChange(amount,index-1,coins) + countChange(amount-coins[index],index,coins);

}
int
main(int argc,char** argv)
{
  int x[]={5,10,20,50,100,200,500};
  printf(" \n %d \n",countChange(301,LEN(x)-1,x));
  return 0;
}
