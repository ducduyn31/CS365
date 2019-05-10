#include <iostream>

using namespace std;

int main() {
    int SIZE = 0;
    cout << "How many elements" << endl;
    cin >> SIZE;
    int arr[SIZE];
    cout << "Enter " << SIZE << " elements: ";
    for (int & i : arr)
        cin >> i;

    int leftLimit = 0, rightLimit = 0;
    cout << "Enter range (a,b): ";
    cin >> leftLimit >> rightLimit;

    int max = 1 << 31;
    int counter = 0;

    for ( int & i : arr) {
        if (i > max) max = i;
        if (i > leftLimit && i < rightLimit) counter++;
    }

    cout << "Max: " << max << '\n';
    cout << "Number of elements in range (" << leftLimit << ", " << rightLimit << "): " << counter << '\n';

    return 0;
}