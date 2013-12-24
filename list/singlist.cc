#include <iostream>
#include <cstdlib>
using namespace std;
struct node {
  int data;
  node* next;
};
void
insert(node** head, int data)
{
  node* temp= (node*) malloc(sizeof(node));
  temp->data= data;
  temp->next= NULL;
  if(*head == NULL)
  {
    *head= temp;
    return;
  }
  temp->next= *head;
  *head= temp;
}
void
printlist(node* head)
{
  node* temp= head;
  while (temp != NULL)
  {
    cout<<temp->data<<"  ";
    temp= temp->next;
  }
  cout<<endl;
}
bool
removeNode(node** head, int data)
{
  node* temp= *head;
  node* prev= NULL;
  while (temp != NULL)
  {
    if (temp->data == data)
      break;
    prev= temp;
    temp= temp->next;
  }
  if (temp == NULL)
    return false;

  if (prev == NULL)
  {
    *head= temp->next;
    delete temp;
    return true;
  }
  prev->next= temp->next;
  delete temp;
  return true;
}
void
reverseList(node** head)
{
  if (*head == NULL)
    return;

  if ((*head)->next == NULL)
    return;
  node* prev= NULL;
  node* move= *head;
  node* temp;
  while (move != NULL)
  {
    temp= move->next;
    move->next= prev;
    prev= move;
    move= temp;
  }
  *head= prev;

}
int
main(int argc, char** argv)
{
  node *slist= NULL;
  insert(&slist, 5);
  insert(&slist, 3);
  insert(&slist, 1);
  insert(&slist, 7);
  printlist(slist);
  removeNode(&slist, 1);
  printlist(slist);
  removeNode(&slist, 7);
  printlist(slist);
  insert(&slist, 7);
  printlist(slist);
  reverseList(&slist);
  cout<<"Reversed list: "<<endl;
  printlist(slist);
  cout<<endl;
  return 0;
}
