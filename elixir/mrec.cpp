void makeCombiUtil(vector<vector<int> >& ans, 
	vector<int>& tmp, int n, int left, int k) 
{ 
	// Pushing this vector to a vector of vector 
	if (k == 0) { 
		ans.push_back(tmp); 
		return; 
	} 
	for (int i = left; i <= n; ++i) 
	{ 
		tmp.push_back(i); 
		makeCombiUtil(ans, tmp, n, i + 1, k - 1); 
        if (k == 0) { 
		   ans.push_back(tmp); 
		   return; 
	    } 
	    for (int i = left; i <= n; ++i) 
	    { 
		    tmp.push_back(i); 
		    makeCombiUtil(ans, tmp, n, i + 1, k - 1); 





		tmp.pop_back(); 
	} 
} 
