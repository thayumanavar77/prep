#include <iostream>
#include <stack>

using namespace std;

int
main(int argc,char** argv)
{
  stack<char> c;
  c.push('c');
  c.push('b');
  cout<<c.top()<<endl;
  c.pop();
  cout<<c.top()<<endl;
  c.pop();
  return 0;
}
