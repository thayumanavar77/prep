struct Node {
  int data;
  Node* next;
  Node* prev;
};
Node* Reverse(Node* head)
{
  Node* temp= NULL;
  Node* cur= head;

  while(cur != NULL) {
    temp= cur->prev;
    cur->prev= cur->next;
    cur->next= temp;
    cur= cur->prev;
  }

  if (temp != NULL)
    return temp->prev;
  return head;
}
