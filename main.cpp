#include <iostream>

using namespace std;

int main() {
    int rows = 0;
    cout << "How many rows: ";
    cin >> rows;

    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < rows - i - 1; ++j) {
            cout << ' ';
        }
        int step = 1;
        int val = 1;

        for (int k = 0; k < 2 * i + 1; ++k) {
            if (val == 1) cout << 1;
            else if (k == i) cout << '|';
            else if (val == 2 && step == 1) cout << '<';
            else if (val == 2) cout << '>'; // step = -1
            else cout << '-';
            val += step;
            if (val == i + 1) step = -1;
        }
        cout << '\n';
    }
    return 0;
}