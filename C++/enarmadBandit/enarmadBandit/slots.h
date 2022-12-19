#pragma once
#include <iostream>
#include <ctime>
using namespace std;

char slotRand() {
	char grid[3] = { 'A','O','X' };
	return grid[rand() % 3];
}
char slotResult(char grid[3][3]) {
	int totalWins = 0;
	int totalLoss = 0;
	for (int i = 0; i < 3; i++) {
		if (grid[0][0+i] == grid[1][0+i] && grid[1][0+i] == grid[2][0+i]) {
			totalWins++;
			cout << "You've won V\n";
		}
		if (grid[0+i][0] == grid[0+i][1] && grid[0+i][1] == grid[0+i][2]) {
			totalWins++;
			cout << "You've won ->\n";
		}
		//if (grid[0][0] != grid[0][1] && grid[0][1] != grid[0][2]) {
		else {
			totalLoss++;
			cout << "You've lost\n";
		}
	}
	cout << "You've won " << totalWins << " and lost " << totalLoss << " so far.\n";
	return 0;
}
void slotGame() {
	srand(time(0));
	char grid[3][3];
	for (int i = 0; i < 3; i++) { // loopar 3 ggr
		cout << "---------" << endl;
		for (int j = 0; j < 3; j++) { // loopar 3 ggr / 1 loop ovan
			grid[i][j] = slotRand();
			cout << "|" << grid[i][j] << "|";
		}
		cout << endl;
	}
	cout << "---------" << endl;
	slotResult(grid);
}