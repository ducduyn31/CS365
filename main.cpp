#include <iostream>

using namespace std;

int main() {
    int i;
    cout << "Enter 1 number: ";
    cin >> i;

    unsigned int mask = 1 << 31;
    for (int j = 0; j < 32; ++j) {
        if ((i & mask) == mask) cout << '1';
        else cout << '0';

        mask = mask >> 1;
    }
    return 0;
}