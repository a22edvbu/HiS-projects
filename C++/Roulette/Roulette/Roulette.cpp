#include <iostream>;
#include <ctime>; 
using namespace std;

int gambleAge;
int betPrize;
int wallet = 1000 + betPrize;
int bet;
int valNumber;
int valNumberFinal;

char spinConfirm;

string valType;
string valColor;
string valColorFinal;

int main()
{
    cout << "You have to be over 18 to play this game.\n";
    
    cout << "How old are you?\n";
    cin >> gambleAge;

    if (gambleAge < 18)                                                                             // Åldersgräns
    {
        cout << "You have to be over 18 to play this game.\n";
        return 0;
    }
    else
    {
        cout << "Welcome to GaZoline Energy bar and casino!\n";
    }

    cout << "You have " << wallet << " kr worth of chips.\n";                                            // Definerar regler osv.
    cout << "You can place bets worth 100, 300 or 500 kr to win amazing prices!\n";



    while (bet != 100 && bet != 300 && bet != 500)
    {
        cout << "Your bet: ";
        cin >> bet;

        if (bet == 100 || bet == 300 || bet == 500)                                                     // Satsning
        {
            cout << "Your bet: " << bet << "kr" << endl;
        }
        else
        {
            cout << "You have to bet 100, 300 or 500 kr to play.\n";
        }
    }
    
    cout << "Do you want ot bet on a color or a number?\n";
    cin >> valType;

    if (valType == "Color" || valType == "color" || valType == "COLOR")                             // val mellan färg eller nummer
    {
        while (valColor != "Black" || valColor != "black" || valColor != "BLACK" || valColor != "Red" || valColor != "red" || valColor != "RED")
        {
            cout << "You're betting on a " << valType << ". Do you want to bet on red or black?\n";
            cin >> valColor;
        
            if (valColor == "Black" || valColor == "black" || valColor == "BLACK" || valColor == "Red" || valColor == "red" || valColor == "RED" )
            {
                cout << "You've placed a bet on " << bet << " kr on " << valColorFinal << endl;
                valColorFinal = valColor;
            }
            else
            {
                cout << "You have to choose between red or black to place a bet.\n";
            }
        }
    }
    else if (valType == "Number" || valType == "number" || valType == "Number")
    {
        while (valNumber <= 1 || valNumber >= 36)
        {
            cout << "Place a bet on a number between 1-36.\n";
            cin >> valNumber;

            if (valNumber >= 1 && valNumber <= 36)
            {
                valNumberFinal = (valNumber);
                cout << "You've placed a bet on " << bet << " kr on number " << valNumberFinal << endl;
            }
            else
            {
                cout << "This number does not exist on the roulette wheel.\n";
            }
        }
    }
    else 
    {
        return 0;
    }

    while (spinConfirm != 'Y' && spinConfirm != 'y')
    {
        cout << "Are you ready to spin? Y/N\n";
        cin >> spinConfirm;

        if (spinConfirm == 'Y' || spinConfirm == 'y') 
        {
            cout << "*Spins the wheel*\n"; 
        }
        else
        {
            cout << "You need to type Y to play.\n";
        }
    }
}

