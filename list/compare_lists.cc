struct Node {
  int data;
  struct Node* next;
};
int CompareLists(Node* headA, Node* headB)
{
  if (headA == NULL && headB == NULL)
    return 1;
  if (headA == NULL || headB == NULL)
    return 0;

  if (headA->data == headB->data)
    return CompareLists(headA->next, headB->next);

  return 0;
}
