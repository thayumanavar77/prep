struct Node {
  int data;
  struct Node *next;
};
Node* insert(Node *head, int data)
{
  Node* temp= (Node*) malloc(sizeof(struct Node));
  temp->data= data;
  temp->next= head;
  return temp;
}
