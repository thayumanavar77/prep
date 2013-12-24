#include <iostream>
#include <queue>
#include <algorithm>

using namespace std;
struct TreeNode
{
  int d;
  TreeNode* left;
  TreeNode* right;
  TreeNode(int data) : d(data), left(NULL),
		    right(NULL)
  {
  }
};
struct NodeInfo
{
  int d;
  int num_anc;
  bool operator< (const NodeInfo& rhs) const
  {
    return d < rhs.d;
  }
};
TreeNode*
treeFromMatrix(int **ancmat, int len)
{
  queue<TreeNode*> q;
  TreeNode* tmpNode;
  int d;
  int newNodeIdx;

  NodeInfo node_info[len];

  for (int i= 0; i < len; i++) {
    node_info[i].d= i;
    node_info[i].num_anc= 0;
    for (int j= 0; j < len; j++)
      node_info[i].num_anc += ancmat[i][j];
  }

  std::sort(node_info, node_info+len);
  if (node_info[0].num_anc != 0) {
    cout<<" Invalid Matrix "<<endl;
    cout<<endl;
    return NULL;
  }

  TreeNode* rootNode= new TreeNode(node_info[0].d);
  q.push(rootNode);

  int i= 1;
  while(!q.empty()) {
    tmpNode= q.front();
    q.pop();
    newNodeIdx= node_info[i].d;
    if (ancmat[newNodeIdx][tmpNode->data]) {
      tmpNode->left= new TreeNode(newNodeIdx);
      i++;
      q.push(tmpNode->left);
    }
    newNodeIdx= node_info[i];
    if (ancmat[newNodeIdx][tmpNode->data]) {
      tmpNode->right= new TreeNode(newNodeIdx);
      i++;
      q.push(tmpNode->right);
    }
  }
  return rootNode;
}
void
preorder(TreeNode* root)
{
  if (root == NULL)
  {
    cout<<endl;
    return;
  }
  cout<<root->data<<"  ";
  preorder(root->left);
  preorder(root->right);
}
  
int
main()
{
  int n;
  cin>>n;
  int ancmat[n][n];
  for (int i= 0; i < n; i++)
    for (int j= 0; j < n; j++)
      cin>>ancmat[i][j];

  preorder(treeFromMatrix(ancmat,n));

  return 0;
}
