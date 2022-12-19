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

    while (gambleAge < 20){
        cout << "How old are you?\n";
        cin >> gambleAge;

        if (gambleAge >= 20) {
        }
        else {
            cout << "!!! You have to be 20 or older to play this game. !!!\n";
            return 0;
        }
    }
    cout << "------------- Welcome to GaZoline Energy bar and casino! -------------\n";
    while (wallet < 100) {
        cout << "You are playing slots. How much would you like to add to your wallet?\n";

        cin >> wallet;
        if (wallet >= 100) {
            cout << "You've invested " << wallet << " kr to your wallet.\n";
        }
        else {
            cout << "--!!! You have to invest 100 kr or more to play. !!!--\n";
        }
    }
    //cout << slotResult() << endl;
    while (wallet >= 100) {
        cout << "Wallet: " << wallet << endl;
        int bet = betting();
        wallet -= bet;
        cout << wallet << endl;
        int totalWins = slotGame();
        int winMutli = winModifier(totalWins);
        cout << winMutli << endl;
    }
    cout << "!!! You've ran out of money !!!\n";
    return 0;
}