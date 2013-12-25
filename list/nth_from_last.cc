struct Node {
  int data;
  struct Node *next;
};
int GetNode(Node* head, int positionFromTail)
{
  Node* move3= head;
  Node* move1= head;

  while(positionFromTail != 0) {
    move3= move3->next;
    positionFromTail--;
  }

  while(move3->next != NULL) {
    move3= move3->next;
    move1= move1->next;
  }
  return move1->data;
}
