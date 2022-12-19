#pragma once
#include <iostream>
#include <ctime>
#include "slots.h"
using namespace std;

int winModifier(int totalWins) {
	int winMulti = 5;
	switch (totalWins) {
	case 1:
		winMulti == 2;
		break;
	case 2:
		winMulti == 3;
		break;
	case 3:
		winMulti == 4;
		break;
	case 4:
		winMulti == 5;
		break;
	case 5:
		winMulti == 7;
		break;
	case 6:
		winMulti == 7;
		break;
	case 7:
		winMulti == 7;
		break;
	case 8:
		winMulti == 10;
		break;
	}
	return winMulti;
}