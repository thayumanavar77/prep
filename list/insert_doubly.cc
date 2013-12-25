struct Node
{
  int data;
  Node* next;
  Node* prev;
};
Node* SortedInsert(Node* head, int data)
{
  Node* cur= head;
  Node* temp= (Node*) malloc(sizeof(Node));

  temp->data= data;
  temp->next= NULL;
  temp->prev= NULL;

  if (head == NULL)
    return temp;

  while(cur->data <= data && cur->next != NULL)
    cur= cur->next;
  if (cur->data > data) {
    if(cur->prev != NULL)
      cur->prev->next= temp;
    temp->next= cur;
    temp->prev= cur->prev;
    cur->prev= temp;
    if (cur == head) return temp;
  }
  else {
    cur->next= temp;
    temp->prev= cur;
  }
  return head;
}
