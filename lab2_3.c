int isPrime(int n) {
	int star = 0;
	for(int i = 2; i <= n / 2; i++) if(n % i == 0) {
			star = 1;
			break;
		}
	return star;
}

int main() {
	int K[100];
	int count = 0;
	for(int i = 2; i < 100; i++) {
		if(isPrime(i) == 0) {
			K[count++] = i;
		}
	}
	
	return 0;
}
