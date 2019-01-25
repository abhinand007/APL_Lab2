int checkNum(int n) {
	int star = 0;
	for(int i = 2; i <= n / 2; i++) {
		if(n % i == 0) {
			star = 3;
			break;
		}
	}
	if(star == 0) {
		if(n % 2 == 0) star = 1;
		else if(n % 2 == 1) star = 2;
	}

	return star;
}

int main() {
	int n = 11;
	switch(n) {
		case 1:
			n++;
			break;
		case 2:
			while(checkNum(n) != 3) n++;
			break;
		case 3:
			n++;
			break;
	}
	
	return 0;
}
