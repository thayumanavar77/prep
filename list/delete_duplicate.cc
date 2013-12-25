struct Node {
  int data;
  struct Node* next;
};
Node* RemoveDuplicates(Node* head)
{
  if (head==NULL)
    return NULL;
  Node* prev=head,*cur= head->next;
  while(cur != NULL) {
    if (prev->data == cur->data) {
      prev->next=cur->next;
      free(cur);
      cur= prev->next;
      continue;
    }
    prev= cur;
    cur= cur->next;
  }
  return head;
}
