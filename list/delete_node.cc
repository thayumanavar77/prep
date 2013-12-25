struct Node {
  int data;
  struct Node* next;
};

Node* delete(Node* head, int position)
{
  Node* cur= head;
  Node* prev= NULL;

  if (head==NULL) return NULL;

  while (cur != NULL && position != 0) {
    prev= cur;
    cur= cur->next;
    position--;
  }

   Node* temp= cur->next;
   free(cur);
   if (prev==NULL)
      return temp;
    prev->next=temp;
    return head;
}
