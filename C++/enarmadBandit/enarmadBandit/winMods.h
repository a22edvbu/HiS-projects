#pragma once
#include <iostream>
#include <ctime>
#include "slots.h"
using namespace std;

int winModifier(int totalWins) {		// denna funktion ger den totala summan av rätta rader med en vinstmodifier som adderas med spelarens sats för att skapa vinstsumman. 
	int winMulti = 0;
	switch (totalWins) {
	case 0: 
		winMulti = 0;
		break;
	case 1:
		winMulti = 2;
		break;
	case 2:
		winMulti = 3;
		break;
	case 3:
		winMulti = 4;
		break;
	case 4:
		winMulti = 5;
		break;
	case 5:
		winMulti = 7;
		break;
	case 6:
		winMulti = 7;
		break;
	case 7:
		winMulti = 7;
		break;
	case 8:
		winMulti = 10;
		break;
	}
	if (winMulti >= 1) {
		cout << "Congrats! You've won with " << totalWins << " and won " << winMulti << " times your bet!\n";
	}
	else {
		cout << "Sorry, you didn't win this time.\n";
	}
	return winMulti;
}