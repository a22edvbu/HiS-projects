#include <iostream>
using namespace std;

int wallet = 1000;
int bet;
int valSiffra;

string valColor;

int main()
{
    cout << "Välkommen till GaZoline Casino och Bar.\n";
    cout << "Du har 1000kr värt av chips.\n";
    cout << "Du kan satsa 100kr, 200kr eller 500kr för en chans att vinna!\n";

    cout << "Din sats: ";
    cin >> bet;

    if (bet == 100 || bet == 300 || bet == 500)
    {
        cout << "Din sats: " << bet << "kr" << endl;
    }
    else
    {
        cout << "Du måste satsa 100kr, 300kr eller 500kr";
    }
    
    cout << "Vill du satsa på ett nummer eller en färg?\n";
    cout << "Du kan satsa på ett nummer mellan 1 och 36 eller svart eller röd färg\n";

    cout << "Ditt val (siffra): ";
    cin >> valSiffra;
    cout << "Ditt val (färg): ";
    cin >> valColor; 

    if (valSiffra >= 1 && valSiffra <= 36)
    {
        cout << "Du satsar på>>: " << valSiffra;

    }
    else if (valColor == "svart" || valColor == "rött" || valColor == "röd" || valColor == "Svart" || valColor == "Rött" || valColor == "Röd")
    {
        cout << "Du satsar på--: " << valColor;
    }
    else if (valSiffra == 0)
    {
        cout << "Du har fel >:(";
    }
    else
    {
        cout << "Du har fel >:)";
    }
}

