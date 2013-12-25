struct Node {
  int data;
  struct Node* next;
};
Node* InsertNth(Node* head, int data, int position)
{
  Node* temp= (Node*) malloc(sizeof(struct Node));
  temp->data= data;
  temp->next= NULL;

  Node* prev= NULL;
  Node* cur= head;

  while (cur != NULL && position != 0) {
    prev= cur;
    cur= cur->next;
    position--;
  }

  if (prev != NULL)
    prev->next= temp;

  temp->next= cur;
  if (prev == NULL) return temp;
  return head;
}
