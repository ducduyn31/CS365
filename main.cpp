#include <iostream>

using namespace std;

int main() {

    int len = 0;
    cout << "Length of string: ";
    cin >> len;

    char mayBePalindrome[len+1];
    cin.getline(mayBePalindrome, len);
    mayBePalindrome[len] = 0;

    int mid = len / 2;
    int i = 0;
    bool isPalindrome = true;
    while ( i < mid) {
        if (mayBePalindrome[i] != mayBePalindrome[len-1-i]){
            isPalindrome = false;
            break;
        }
        i += 1;
    }

    if (isPalindrome) cout << "Is palindrome\n";
    else cout << "Not palindrome\n";

    return 0;
}