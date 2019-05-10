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
            cout << val;
            val += step;
            if (val == i + 1) step = -1;
        }
        cout << '\n';
    }
    return 0;
}