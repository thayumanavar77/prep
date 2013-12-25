struct Node {
  int data;
  struct Node *next;
};
Node* Reverse(Node* head)
{
  if (head==NULL) return NULL;

  Node* prev= NULL;
  Node* cur= head;

  while(cur != NULL) {
    Node* temp= cur->next;
    cur->next= prev;
    prev= cur;
    cur= temp;
  }

  if (prev==NULL)
    return head;
  return prev;
}
