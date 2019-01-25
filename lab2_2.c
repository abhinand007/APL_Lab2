int main() {
	register int n = 10;
	register int m = 7;
	int A[n];
	for(int i = 0; i < n; i++) {
		A[i] = i;
	}
	for(int i = 0; i < n; i++) A[i] += m;
	
	return 0;
}
