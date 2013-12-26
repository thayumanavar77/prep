#include <iostream>
#include <vector>
#include <string>
#include <sstream>
#include <queue>

using namespace std;

struct Position
{
  int row;
  int col;
  Position(int r,int c) : row(r), col(c) {}
};

struct GridNode
{
  vector < string > wordgrid;
  vector< Position > wordloc;
  vector< string > words;
  GridNode(vector< string >& wg, vector< Position >& wl,vector< string >& w)
    : wordgrid(wg), wordloc(wl), words(w)
  {
  }
  GridNode() { }
};

void
outputSolution(GridNode&);
void
getWordsForPos(Position& wp, vector< string >& wordgrid, vector< string >&  words, vector< string >& lwords)
{
}


void
checkWordPos(std::string word, Position& wp, vector< string >& wordgrid)
{


}


void
extract_position(vector< string >& wordgrid, vector< Position >& wordpos)
{
  for (int i=0; i<10;i++)
    for (int j=0; j<10;j++)
    {
      if (wordgrid[i][j]!='+')
        wordpos.push_back(Position(i,j));
    }
}

Position
findwordloc(GridNode& cur)
{
  //return a single word loc

}

bool
generate_new_pos(GridNode& cur, const string w, Position p, vector< vector<string> >& nwordgrid, bool horiz)
{
  int row= p.row;
  int col= p.col;

  if ( w == "")
  {
    //cout<<" REACHED AND CONSUMED COMPLETE WORD"<<endl;
    return true;
  }
  if ( row >= 10 || col >= 10)
    return false;
  if ( row < 0 || col < 0)
    return false;
  if (cur.wordgrid[row][col] == '+')
    return false;
  //outputSolution(cur); cout<<" generation new pos for words "<<w<<endl;
  if ( ((cur.wordgrid[row][col] == w[0]) || (cur.wordgrid[row][col] == '-'))) {
  if (horiz){
    if(generate_new_pos(cur,w.substr(1), Position(row+1,col),nwordgrid, horiz))
  {
    if (nwordgrid.empty()) {
      vector< string > gw= cur.wordgrid;
      gw[row][col]= w[0];
      nwordgrid.push_back(gw);
    }
    else {
      for (vector< vector<string> >::iterator witer= nwordgrid.begin(); witer != nwordgrid.end(); ++witer)
      {
        (*witer)[row][col]= w[0];
      }
    }
    return true;
  }
  }
  else {
  if(generate_new_pos(cur,w.substr(1), Position(row,col+1),nwordgrid,horiz))
  {
    if (nwordgrid.empty()) {
      vector< string > gw= cur.wordgrid;
      gw[row][col]= w[0];
      nwordgrid.push_back(gw);
#if 0
      cout<<"**********"<<endl;
      cout<<"set word at pos ("<<row<<" , "<<col<<endl;
      cout<<"word w "<<w[0]<<endl;
      cout<<"*****"<<endl;
#endif
    }
    else {
      for (vector< vector<string> >::iterator witer= nwordgrid.begin(); witer != nwordgrid.end(); ++witer)
      {
        (*witer)[row][col]= w[0];
      }
    }
    return true;
  }
  }
  }
  return false;
}


void
getNeighbours(GridNode& cur, vector< GridNode >& neighList)
{
  //Position pw= findwordloc(GridNode& cur);
  vector< Position > wpos= cur.wordloc;

  for (vector< Position >::iterator citer= wpos.begin(); citer != wpos.end(); ++citer)
  {
  //  getWordsForPos((*citer), cur.wordgrid, cur.`words, lwords);
    for(vector< string >::iterator iter= cur.words.begin(); iter != cur.words.end(); ++iter)
    {
      {
      vector< vector<string> > ng;
      //cout<<" Calling generate new position "<<(*citer).row<<"
      //"<<(*citer).col<< " for word "<<(*iter)<<endl; if (*iter == "ICELAND")
      //cout<<" PLACING ICELAND FOR NEW GRID"<<" at "<<citer->row<<"
      //"<<citer->col<<endl;
      if (generate_new_pos(cur, (*iter),(*citer) ,ng,true))
      {
        vector<string> nwords= cur.words;
        vector<string>::iterator niter;
        for(niter= nwords.begin(); niter != nwords.end(); ++niter)
        {
          if ((*niter) == (*iter))
              break;
        }
        nwords.erase(niter);
        if (!ng.empty())
        {
          for(vector< vector<string> >::iterator witer= ng.begin(); witer != ng.end(); ++witer)
          {
             GridNode g((*witer),wpos,nwords);
             //cout<<" doing horiz placement"<<endl; outputSolution(g);
             neighList.push_back(g);
          }
        }
      }
      }
      {
      vector< vector<string> > ng;

      if (generate_new_pos(cur, (*iter),(*citer) ,ng,false))
      {
        vector<string> nwords= cur.words;
        vector<string>::iterator niter;
        for(niter= nwords.begin(); niter != nwords.end(); ++niter)
        {
          if ((*niter) == (*iter))
              break;
        }
        nwords.erase(niter);
        if (!ng.empty())
        {
          for(vector< vector<string> >::iterator witer= ng.begin(); witer != ng.end(); ++witer)
          {
             GridNode g((*witer),wpos,nwords);
             //cout<<" doing vert placement "<<endl; outputSolution(g);
             neighList.push_back(g);
          }
        }
      }
      }

    }
  }
}

void outputSolution(GridNode& gn)
{
  vector<string> wg = gn.wordgrid;
  cout<<" ***** SOLUTION ***** "<<endl;
  for(vector<string>::iterator witer= wg.begin();witer != wg.end(); ++witer)
  {
      cout<<(*witer)<<endl;
  }
  cout<<"******* *********"<<endl;

}

bool isSolution(GridNode& os)
{
  vector<string> wg = os.wordgrid;
  for(vector<string>::iterator witer= wg.begin();witer != wg.end(); ++witer)
  {
    for (int i=0; i< 10;i++)
      if ((*witer)[i] == '-')
        return false;
  }
  return true;
}

void
search(GridNode& startNode)
{
  std::queue<GridNode> q;
  q.push(startNode);

  while(!q.empty())
  {
    vector< GridNode > neighList;
    GridNode s= q.front();
    q.pop();
    //if (q.empty()) outputSolution(s);
    if (isSolution(s))
    {
      cout<<" SOLVED THE GRID !!!!"<<endl;
      outputSolution(s);
      break;
    }
    if (s.words.empty())
    {
      cout<<"WORD LIST GOT EMPTY"<<endl;
      outputSolution(s);
      break;
    }
    getNeighbours(s, neighList);
    for (vector< GridNode >::iterator nlist= neighList.begin(); nlist != neighList.end(); ++nlist)
      q.push(*nlist);
  }
}
#if 0
int
main(int argc, char** argv)
{
  std::string places;
  vector < string > wordgrid(10);
  vector < string > words;

  for(int i= 0;i < 10;i++)
      cin>>wordgrid[i];
  cin>>places;
  for(int i= 0; i < 10;i++)
    cout<<wordgrid[i]<<endl;
  cout<<places<<endl;
  std::stringstream ss(places);
  string item;

  while (std::getline(ss, item, ';')) {
    words.push_back(item);
    cout<<item<<endl;
  }
  // create an initial configuration
  std::vector<Position> wordPos;
  extract_position(wordgrid,wordPos);
  for (vector< Position >::iterator worditer= wordPos.begin(); worditer != wordPos.end(); ++worditer)
   cout<<(*worditer).row<<"  "<<(*worditer).col<<endl;
  GridNode startNode(wordgrid, wordPos, words);
  search(startNode);

#if 0
  std::vector< vector<string> > wg;
  if(generate_new_pos(startNode, words[1], Position(0,1), wg))
  {
    cout<<" VALID WORD POS FOUND "<<endl;
    for( vector< vector<string> >::iterator witer= wg.begin(); witer != wg.end(); ++witer)
    {
      for(vector<string>::iterator w1iter= (*witer).begin(); w1iter != (*witer).end(); ++w1iter)
        cout<<(*w1iter)<<endl;
    }
  }
#endif  
  return 0;
}



    }
  }
}
void outputSolution(GridNode& gn)
{
  vector<string> wg = gn.wordgrid;
  cout<<" ***** SOLUTION ***** "<<endl;
  for(vector<string>::iterator witer= wg.begin();witer != wg.end(); ++witer)
  {
      cout<<(*witer)<<endl;
  }
  cout<<"******* *********"<<endl;

}

bool isSolution(GridNode& os)
{
  vector<string> wg = os.wordgrid;
  for(vector<string>::iterator witer= wg.begin();witer != wg.end(); ++witer)
  {
    for (int i=0; i< 10;i++)
      if ((*witer)[i] == '-')
        return false;
  }
  return true;
}

void
search(GridNode& startNode)
{
  std::queue<GridNode> q;
  q.push(startNode);

  while(!q.empty())
  {
    vector< GridNode > neighList;
    GridNode s= q.front();
    q.pop();

    if (isSolution(s))
    {
      outputSolution(s);
      break;
    }
    if (s.words.empty())
    {
      cout<<"WORD LIST GOT EMPTY"<<endl;
      outputSolution(s);
      break;
    }
    getNeighbours(s, neighList);
    for (vector< GridNode >::iterator nlist= neighList.begin(); nlist != neighList.end(); ++nlist)
      q.push(*nlist);
  }
}
#endif
int
main(int argc, char** argv)
{
  std::string places;
  vector < string > wordgrid(10);
  vector < string > words;

  for(int i= 0;i < 10;i++)
      cin>>wordgrid[i];
  cin>>places;
  for(int i= 0; i < 10;i++)
    cout<<wordgrid[i]<<endl;
  cout<<places<<endl;
  std::stringstream ss(places);
  string item;

  while (std::getline(ss, item, ';')) {
    words.push_back(item);
    cout<<item<<endl;
  }
  // create an initial configuration
  std::vector<Position> wordPos;
  extract_position(wordgrid,wordPos);
  for (vector< Position >::iterator worditer= wordPos.begin(); worditer != wordPos.end(); ++worditer)
   cout<<(*worditer).row<<"  "<<(*worditer).col<<endl;
  GridNode startNode(wordgrid, wordPos, words);
  search(startNode);

#if 0
  std::vector< vector<string> > wg;
  if(generate_new_pos(startNode, words[1], Position(0,1), wg))
  {
    cout<<" VALID WORD POS FOUND "<<endl;
    for( vector< vector<string> >::iterator witer= wg.begin(); witer != wg.end(); ++witer)
    {
      for(vector<string>::iterator w1iter= (*witer).begin(); w1iter != (*witer).end(); ++w1iter)
        cout<<(*w1iter)<<endl;
    }
  }
#endif  
  return 0;
}
