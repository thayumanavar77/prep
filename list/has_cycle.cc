struct Node {
  int data;
  struct Node* next;
};
int HasCycle(Node* head)
{
  Node* fast= head;
  Node* slow = head;

  while(fast != NULL && slow != NULL) {
    if (fast->next == NULL)
      break;
    fast= fast->next->next;
    slow= slow->next;
    if (fast == slow)
      return 1;
  }
  return 0;
}
