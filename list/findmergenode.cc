struct Node {
  int data;
  Node* next;
};

int FindMergeNode(Node* headA, Node* headB)
{
  int l1=0,l2=0;
  Node* cur= headA;
  Node* cur1;
  int skip;

  while(cur != NULL) {
    l1++;
    cur= cur->next;
  }

  cur= headB;
  while(cur != NULL) {
    l2++;
    cur= cur->next;
  }
  if (l1>l2) {
    cur= headA;
    cur1= headB;
    skip= l1-l2;
  }
  else {
    cur= headB;
    cur1= headA;
    skip= l2-l1;
  }
  while (skip != 0) {
    cur= cur->next;
    skip--;
  }
  while(cur != cur1) {
    cur=cur->next;
    cur1=cur1->next;
  }
  return cur->data;
}
