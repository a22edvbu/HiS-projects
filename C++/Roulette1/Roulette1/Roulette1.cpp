#include <iostream>
#include <ctime>

using namespace std;

int main()
{
	int wallet = 1000;												// Deklarerar sin plånbok och hur mycket man kan spendera
	cout << "You have to be over 18 to play this game.\n";
	cout << "How old are you?\n";
	int gambleAge;

	cin >> gambleAge;
	if (gambleAge < 18) {											// Om man är under 18 stängs spelet ner
		cout << "You have to be over 18 to play this game.\n";
		return 0;
	}

	while (wallet < 100) {
		cout << "Welcome to GaZoline Energy bar and casino!\n";
		cout << "You have " << wallet << " kr worth of chips.\n";                                            // Förklarar spelets regler
		cout << "You can place bets worth 100, 300 or 500 kr to win amazing prices!\n";
		cout << "Your bet: ";
		int bet;
		cin >> bet;
		while (bet != 100 && bet != 300 && bet != 500) {			// Itererar så länge 100, 300 eller 500 inte väljs
			if (bet == 100 || bet || 300 && bet || 500) {
				cout << "Your bet: " << bet << " kr" << endl;
			}
			else {
				cout << "You have to bet 100, 300 or 500 kr to play.\n";
			}
		}
	}
	cout << "Do you want to bet on a color or a number?\n";
	string valType;
	cin >> valType;
	if (valType == "Color" || valType == "color" || valType == "COLOR") {
		string valColor;
		while (valColor != "Red" && valColor != "red" && valColor != "RED" && valColor != "Black" && valColor != "black" && valColor != "BLACK") {
			cout << "You're betting on a " << valType << ". Do you want to bet on red or black?\n";
			cin >> valColor;
			if (valColor == "Black" || valColor == "black" || valColor == "BLACK" || valColor == "Red" || valColor == "red" || valColor == "RED") {
				cout << "You have to pick red or black.\n";
			}
			else {
				cout << "You have to pick red or black.\n";
			}
		}
	}
	else if (valType == "number" || valType == "Number" || valType == "NUMBER") {
		int valNumber;
		while (valNumber <= 1 && valNumber >= 36) {
			cout << "You're betting on a " << valType << ". Choose a number between 1 and 36";
			cin >> valNumber;
			if (valNumber >= 1 && valNumber <= 36) {
				cout << "";
			}
		}
	}
}