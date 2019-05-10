#include <iostream>
#include <cstring>

using namespace std;

int main() {
    const int SIZE = 256;
    char str[SIZE] = {0};

    for (;;) {
        cout << "Enter a string: ";
        cin.getline(str, SIZE);
        int len = strlen(str);
        if (len == 0 || len > 20) break;

        char temp[len + 1];
        for (int i = 0; i < len; ++i) {
            temp[i] = str[len - i - 1];
        }
        temp[len] = 0;
        cout << temp << endl;
    }

    return 0;
}