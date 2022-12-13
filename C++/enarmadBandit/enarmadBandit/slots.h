#pragma once
#include <iostream>
#include <ctime>
using namespace std;

char slotRand() {
	char grid[3] = { 'A','O','X' };
	return grid[rand() % 3];
}
int slotGame() {
	srand(time(0));
	char grid[3][3];
	for (int i = 0; i < 3; i++) { // loopar 3 ggr
		cout << "  ---------" << endl;
		for (int j = 0; j < 3; j++) { // loopar 3 ggr / 1 loop ovan
			grid[i][j] = slotRand();
			cout << "|" << grid[i][j] << "|";
		}
		cout << endl;
	}
	cout << "  ---------" << endl;
	//slotResult(grid);
	return grid[3][3];
}
char slotResult(char grid[3][3]) {
	/*switch (grid[3][3]) {
	case grid[0][0] == 'A' && grid[0][1] == 'A' && grid[0][2] == 'A':
		cout << "H1";
		break;
	}*/
	return 0;
}