/*
 * My final submission for question 5.  This scores 100/100
 */

#include <iostream>
#include <unordered_map>

using namespace std;

int main()
{
	int n, a, b;
	cin >> n >> a >> b;
	cin.ignore(1000, '\n');
	long double *arr = new long double[n];
	long double *ev = new long double[n];

	for(int i = 0; i < n; i++)
	{
		cin >> arr[i];
		ev[i] = 0;
	}

	long double chooseCoeff = ((long double) (n-2)) / ((long double)n);
	long double indexSum = 2.0/((long double)(n*(n-1)));

	bool endA;
	bool noB = false;
	for(int i = 0; i < a; i++)
	{
        long double sum = 0;
        for(int j = 0; j < n; j++)
        {
            sum += arr[j];
        }
        
		for(int j = 0; j < n; j++)
		{
			ev[j] = chooseCoeff*arr[j] + (sum - arr[j])*indexSum;
		}
        
		endA = true;
		for(int j = 0; j < n; j++)
		{
            if(arr[j] > ev[j] && arr[j] - ev[j] > 0.0001)
                endA = false;
            else if(arr[j] < ev[j] && ev[j] - arr[j] > 0.0001)
                endA = false;
			arr[j] = ev[j];
			ev[j] = 0;
		}
		if(endA)
		{
			noB = true;
			break;
		}

	}

	long double totalComp = ((long double)n)*((long double)(n-1))/2.0;
    bool endB;

	// reversing
	for(int times = 0; times < b; times++)
	{
		if(noB) break;
        long double elemTotal = 0;
        for(int i = 0; i < n; i++)
        {
            elemTotal += arr[i];
        }
		for(int i = 0; i < n; i++)
		{
			// combinations where i is not involved
			long double inPlace;
			long double nLeft, nRight;
			if(i < 2)
				nLeft = 0;
			else
				nLeft = i*(i-1)/2.0;

			if(i > n-3)
				nRight = 0;
			else
				nRight = (n-i-1)*(n-i-2)/2.0;

			inPlace = nLeft + nRight;
			inPlace *= arr[i]; // E(x) = xp;

			// combinations where i is one of the chosen numbers
			long double edge = elemTotal-arr[i];

			// combinations where i is in between that is,
			// l < i, r > i
            long double between = 0;
            if(i != 0 && i != n-1)
            {
                int minDFromEdge = (n-i-1 < i)? n-i-1 : i;
                int j;
                for(j = 1; j < minDFromEdge; j++)
                {
                    between += j* (arr[j] + arr[n-j-1]);
                }
                long double psum = 0;
                for(int k = j; k <= n-j-1; k++)
                {
                    psum += arr[k];
                }
                between += j*psum;
            }

			ev[i] = (inPlace + edge + between) / totalComp;
		}

        endB = true;
		for(int i = 0; i < n; i++)
		{
            if(arr[i] > ev[i] && arr[i] - ev[i] > 0.0001) endB = false;
            else if(arr[i] < ev[i] && ev[i] - arr[i] > 0.0001) endB = false;
            arr[i] = ev[i];
			ev[i] = 0;
		}
        if(endB) break;
	}

	long double sumOfSubsets = 0;
	for(int i = 0; i < n; i++)
	{
		long double prevSum = arr[i];
		for(int j = i+1; j < n; j++)
		{
			long double thisSum = prevSum + arr[j];
			sumOfSubsets += thisSum;
			prevSum = thisSum;
		}
	}
	
	cout << sumOfSubsets/totalComp << endl;

	delete [] ev;
	delete [] arr;

}