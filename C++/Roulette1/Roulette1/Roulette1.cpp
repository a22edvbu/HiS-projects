#include <iostream>;
#include <ctime>; 
using namespace std;

int main()
{
    int gambleAge;
    int wallet = 1000;
    int replay = 0;

    cout << "You have to be over 18 to play this game.\n";

    cout << "How old are you?\n";
    cin >> gambleAge;

    if (gambleAge < 18) {       // Åldersgräns
        cout << "You have to be over 18 to play this game.\n";
        return 0;
    }
    while (replay != '1' && replay != 'y' && wallet >= 100) {
        int winPrize;
        int bet = 0;
        int valNumber = 0;
        int spinRand;
        int spinRandNumber;
        int winNumber;
        int winColor;

        char spinConfirm;
        char replayQuestion;

        string valType;
        string valColor = "0";
        string spinRandColor;
        replay = 0;


        cout << "------------- Welcome to GaZoline Energy bar and casino! -------------\n";
        cout << "You have " << wallet << " kr worth of chips.\n";                                            // Definerar regler osv.
        cout << "You can place bets worth 100, 300 or 500 kr to win amazing prices!\n";

        while (bet != 100 && bet != 300 && bet != 500) {
            cout << "Your bet: ";
            cin >> bet;

            if (bet == 100 || bet == 300 || bet == 500)
            {
                cout << "Your bet is: " << bet << "kr" << endl;
            }
            else
            {
                cout << "You have to bet 100, 300 or 500 kr to play.\n";
            }
        }

        /*  Här får spelaren bestämma vad de vill satsa på.
            Valen är mellan ett nummer mellan 1 - 36 eller en svart eller röd färg.

            Mina while loops fastnade där även om jag satte vilkoret på att loopa så länge valColor != Black.
            Tanken var att när användaren skriver in "Black" att iterationen slutar då valColor = "Black", men det funkar inte.
            Funkar när jag gav valColor och valNumber ett värde på 0 och satte iterationens vilkor på != 0 */

        cout << "Do you want ot bet on a color or a number?\n";
        cin >> valType;

        if (valType == "Color" || valType == "color" || valType == "COLOR") {       // val mellan färg eller nummer
            while (valColor == "0") {
                cout << "You're betting on a " << valType << ". Do you want to bet on red or black?\n";
                cin >> valColor;

                if (valColor == "Black" || valColor == "black" || valColor == "BLACK") {
                    cout << "You've placed a bet on " << bet << " kr on " << valColor << endl;
                }
                else if (valColor == "Red" || valColor == "red" || valColor == "RED") {
                    cout << "You've placed a bet on " << bet << " kr on " << valColor << endl;
                }
                else if (valColor != "Black" || valColor != "black" || valColor != "BLACK" || valColor != "Red" || valColor != "red" || valColor != "RED") {
                    cout << "You have to choose between red or black to place a bet.\n";
                }
            }
            if (valColor == "Black" || valColor == "black" || valColor == "BLACK") {
                valColor = "Black";
            }
            else if (valColor == "Red" || valColor == "red" || valColor == "RED") {
                valColor = "Red";
            }
        }
        else if (valType == "Number" || valType == "number" || valType == "Number") {
            while (valNumber <= 1 || valNumber >= 36) {
                cout << "Place a bet on a number between 1-36.\n";
                cin >> valNumber;

                if (valNumber >= 1 && valNumber <= 36) {
                    cout << "You've placed a bet on " << bet << " kr on number " << valNumber << endl;
                }
                else if (valNumber <= 1 || valNumber >= 36) {
                    cout << "This number does not exist on the roulette wheel.\n";
                }
            }
        }
        else
        {
            cout << "You have to pick a number or a color.\n";
        }

        /* Här sker självaste roulettespelet där koden nedan, beroende på om spelaren valt att satsa på en färg eller ett nummer, ger ett slumpvalt resultat.
        */

        cout << "Are you ready to spin the wheel? Y to spin.\n";
        cin >> spinConfirm;
        srand(time(0));


        if (spinConfirm == 'Y' || spinConfirm == 'y') {
            spinRand = rand() % 36 + 1;        // Genererar ett nummer mellan 1 och 36
        }
        else {
            cout << "You have to press Y to play.";
        }

        if (spinRand % 2 == 0) {
            spinRandColor = "Black";
        }
        else {
            spinRandColor = "Red";
        }

        // Win condition
        cout << "The ball landed on " << spinRand << " on " << spinRandColor << "\n";

        if (spinRand == valNumber || spinRandColor == valColor) {	// jämför det genererade talet med valNumber för att avgöra vinst eller ej.
            cout << "------------- YOU WON -------------\n";
            if (spinRand == valNumber) {        // vinst med nummer
                cout << bet << " kr has been depossited to your wallet with a 10x win bonus!\n";
                bet *= 10;
                wallet += bet;
            }
            else {      // Vinst med färg
                cout << bet << " kr has been deposited to your wallet with a 2x win bonus!\n";
                bet *= 2;
                wallet += bet;
            }
        }
        else {
            cout << "------------- YOU LOST -------------\n";
            cout << bet << " kr has been subtracted from your wallet.\n";
            wallet -= bet;
        }
        cout << "Your current balance: " << wallet << " kr" << endl;

        while (replay != 1) {
            cout << "Do you want to play again? Y/N \n";
            cin >> replayQuestion;
            if (replayQuestion == 'Y' || replayQuestion == 'y') {
                replay = 1;
            }
            else if (replayQuestion == 'N' || replayQuestion == 'n') {
                return 0;
            }
            else {
                cout << "Wrong input.\n";
            }
        }
    }

    cout << "You have insufficient funds. Please refil to play again.\n";

    return 0;
}
