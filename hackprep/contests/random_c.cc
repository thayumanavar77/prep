#include <map> 
#include <set> 
#include <list> 
#include <cmath> 
#include <ctime> 
#include <stack> 
#include <queue> 
#include <vector> 
#include <cstdio> 
#include <string> 
#include <bitset> 
#include <climits> 
#include <cstdlib> 
#include <cstring> 
#include <utility> 
#include <sstream> 
#include <iostream> 
#include <algorithm> 
#define sqr(x) ((x)*(x)) 
#define ABS(x) ((x<0)?(-(x)):(x)) 
#define eps (1e-13)
#define mp make_pair 
#define pb push_back 
#define Pair pair<int,int> 
#define xx first 
#define yy second 
#define equal(a,b) (ABS((a)-(b))<eps) 
using namespace std; 
 
template<class T> string tostring(T x) { ostringstream out; out<<x; return out.str();} 
long long toint(string s) { istringstream in(s); long long x; in>>x; return x; } 
 
int dx[8]={0, 0, 1,-1, 1, 1,-1,-1}; 
int dy[8]={1,-1, 0, 0,-1, 1,-1, 1}; 
int kx[8]={1, 1,-1,-1, 2, 2,-2,-2}; 
int ky[8]={2,-2, 2,-2, 1,-1, 1,-1}; 
 
///////////////////////////////////////////////////////////////////////////////////////////////////// 

int d[1000], n;
double p1, p2;

#define MAX 2

typedef struct matrix
{
    int row,col;
    double m[MAX][MAX];
    matrix(int r,int c,int k)
    {
        row=r;
        col=c;
        for (int i=0;i<r;i++)
            for (int j=0;j<c;j++)
                m[i][j]=k;
    }
    matrix(){}
} matrix;
matrix operator *(matrix a,matrix b)
{
    matrix c;
    double t;
    c.row=a.row; c.col=b.col;
    for (int i=0;i<c.row;i++)
    for (int j=0;j<c.col;j++)
    {
        t=0;
        for (int k=0;k<a.col;k++)
        t=(t+a.m[i][k]*b.m[k][j]);
        c.m[i][j]=t;
    }
    return c;
}
matrix pow(matrix a,int k)
{
    matrix c;
    if (k==1) return a;
    c = pow(a, k / 2);
    c = c * c;
    if (k % 2 == 0) return c;
    else return c * a;
}

int ways(int cnt) {
    return cnt * (cnt - 1) / 2;
}

void calc(int cnt) {
    int tot = ways(n);
    matrix m(2, 2, 0);
    m.m[0][0] = (tot - n + 1.0) / tot; m.m[0][1] = (n - 1.0) / tot;
    m.m[1][0] = 1.0 / tot; m.m[1][1] = (tot - 1.0) / tot;

    m = pow(m, cnt);
    p1 = m.m[0][0];
    p2 = m.m[0][1];
}

double f[1000][1000]; // probability of j'th number being at i'th place after all operations
double g[1000][1000];


double sum1[1000][1001], sum2[1000][1001], sum3[1000][1001];
void calc2(int cnt) {
    memset(f, 0, sizeof(f));
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            if (i == j) f[i][j] = p1;
            else f[i][j] = p2 / (n - 1);

    for (int iter = 0; iter < cnt; iter++) {
        for (int c = 0; c < n; c++) {
            sum1[c][0] = sum2[c][0] = sum3[c][0] = 0.0;
            for (int i = 0; i < n; i++) {
                sum1[c][i + 1] = sum1[c][i] + f[i][c];
                sum2[c][i + 1] = sum2[c][i] + f[i][c] * (n - i) / (double) ways(n);
                sum3[c][i + 1] = sum3[c][i] + f[i][c] * (i + 1) / (double) ways(n);
            }
        }
        for (int i = 0; i < n; i++) {
            for (int k = 0; k < n; k++) {
                // same
                g[i][k] += f[i][k] * (min(n - 1 - i, i) + ways(i) + ways(n - 1 - i)) / (double) ways(n);
                if (n - i - 1 > i) g[i][k] += (sum1[k][n - i] - sum1[k][i + 1]) * (i + 1) / (double) ways(n); // i + 1 .. n - i - 1
                if (n - i - 1 < i) g[i][k] += (sum1[k][i] - sum1[k][n - i - 1]) * (n - i) / (double) ways(n); // n - i - 1 .. i - 1

                if (i != n - 1) g[i][k] += (sum2[k][n] - sum2[k][max(n - i - 1, i) + 1]); // max(n - i - 1, i)+1 .. n - 1
                if (i != 0) g[i][k] += (sum3[k][min(n - i - 1, i)]); // 0 .. min(n - i - 1, i) - 1
            }
        }      
        memcpy(f, g, sizeof(g));
        memset(g, 0, sizeof(g));
    }
}

int main() {
//    freopen("random.in", "r", stdin);
    int n1, n2;
    scanf("%d%d%d", &n, &n1, &n2);
    for (int i = 0; i < n; i++)
        scanf("%d", &d[i]);
    calc(n1);
    calc2(n2);
    double res = 0.0;
    for (int i = 0; i < n; i++) { // place
        double p = ((i + 1) * (n - i) - 1.0) / (n * (n - 1) / 2.0);
        for (int j = 0; j < n; j++) // number
            res += d[j] * f[i][j] * p;
    }
    printf("%.9lf\n", res);
    return 0;
}
