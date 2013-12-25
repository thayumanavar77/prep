struct Node {
  int data;
  struct Node *next;
}
void Print(Node *head)
{
  while(head != NULL) {
    cout<<head->data<<endl;
    head= head->next;
  }
}
