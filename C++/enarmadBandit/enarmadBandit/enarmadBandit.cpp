#include <iostream>
#include <ctime>
#include "betting.h"
#include "slots.h"
#include "winMods.h"
using namespace std;

int main()
{
    int gambleAge = 0;
    int wallet = 0;

    while (gambleAge < 20){             // Här skriver användaren in sin ålder. Om användaren är under 20 år kommer spelets stänga ned.
        cout << "How old are you?\n";
        cin >> gambleAge;

        if (gambleAge >= 20) {
        }
        else {
            cout << "--!!! You have to be 20 or older to play this game. !!!--\n";
            return 0;
        }
    }
    cout << "------------- Welcome to GaZoline Energy bar and casino! -------------\n";
    while (wallet < 100) {          // här skriver spelaren in sitt saldo. De kan lägga in så mycket som helst så länge saldot är över 100 kr då det är det minsta möjliga man kan satsa.
        cout << "You are playing slots. How much would you like to add to your wallet?\n";

        cin >> wallet;
        if (wallet >= 100) {
            cout << "You've invested " << wallet << " kr to your wallet.\n";
        }
        else {
            cout << "--!!! You have to invest 100 kr or more to play. !!!--\n";
        }
    }
    char replay = '_';
    while (wallet >= 100 || replay == 'N') {        // Spelets loop
        cout << "Wallet: " << wallet << endl;
        int bet = betting();        // Här kallas funktionen betting() för att ett värde ska kunna ges till variablen bet.
        wallet -= bet;
        cout << wallet << endl;
        int totalWins = slotGame();            // slotGame() är funktionen som utför själva spelet och ger totalWins värdet på den totala summan av rätta rader i spelet.
        int winMutli = winModifier(totalWins);  // winModifier() jämför antalet rätta rader för att ge ett tal som multipliceras med spelarens sats.
        int winAmount = bet * winMutli;
        wallet += winAmount;
        cout << "Total winnings: " << winAmount << endl;
        replay = '_';
        while (replay != 'y' && replay != 'Y') {    // Här är spelets replay funktion.
            cout << "Would you like to play again? Y/N: ";
            cin >> replay;
            if (replay == 'y' || replay == 'Y') {
                replay = 'Y';
            }
            else if (replay == 'n' || replay == 'N') {
                return 0;
            }
            else {
                cout << "--!!! Invalid input !!!--\n";
            }
        }
    }
    cout << "--!!! You've ran out of money !!!--\n";
    return 0;
}