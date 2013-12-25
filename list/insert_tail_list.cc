struct Node {
  int data;
  struct Node *next;
};
Node* Insert(Node* head, int data)
{
  Node* temp= (Node) malloc(sizeof(struct Node));
  temp->data= data;
  temp->next= NULL;

  if (head == NULL)
    return temp;
  Node* temp1= head;
  while(temp1->next != NULL)
    temp1= temp1->next;

  temp1->next= temp;
  return head;
}
