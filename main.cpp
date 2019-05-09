#include <iostream>

using namespace std;

int main() {
    int rows = 0;
    cout << "How many rows: ";
    cin >> rows;

    int cols = rows * 2 -1;
    int midRow = cols / 2;

    for (int i = 0; i < rows; ++i) {
        for (int j = 0; j < cols ; ++j) {
            int distanceToMid = abs(j - midRow);
            int val = i - distanceToMid;
            if ( val < 0 ) {
                cout << ' ';
                continue;
            }
            cout << val + 1;
        }
        cout << '\n';
    }
    return 0;
}