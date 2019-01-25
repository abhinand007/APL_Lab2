int main() {
	int M[3][3], N[3][3];
	int S[3][3];
	for(int i = 0; i < 3; i++) {
		for(int j = 0; j < 3; j++) {
			M[i][j] = i + j;
			N[i][j] = i * j;
			S[i][j] = M[i][j] + N[i][j];
		}
	}

	return 0;
}

