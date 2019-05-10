#include <iostream>

using namespace std;

void merge(int list[], int left, int mid, int right) {
    int leftCursor = left;
    int rightCursor = mid + 1;
    int temp[right - left + 1];

    for (int i = 0; i < right - left + 1; ++i) {
        if (list[rightCursor] < list[leftCursor]) {
            temp[i] = list[rightCursor];
            rightCursor++;
        } else {
            temp[i] = list[leftCursor];
            leftCursor++;
        }

        if (leftCursor == mid + 1) {
            while ( rightCursor <= right) {
                i++;
                temp[i] = list[rightCursor];
                rightCursor++;
            }
            break;
        }

        if (rightCursor == right + 1) {
            while (leftCursor <= mid) {
                i++;
                temp[i] = list[leftCursor];
                leftCursor++;
            }
            break;
        }
    }

    // Copy back to list
    for (int j = left; j <= right; ++j) {
        list[j] = temp[j - left];
    }

}

void mergeSort(int list[], int left, int right) {
    if (left >= right) return;

    int mid = (left + right) / 2;

    // sort left
    mergeSort(list, left, mid);
    // sort right
    mergeSort(list, mid + 1, right);

    // merge both left and right
    merge(list, left, mid, right);
}

int main() {
    const int SIZE = 100;
    int arr[SIZE] = {0}; // Set to all 0
    cout << "Enter " << SIZE << " numbers:\n";

    for (int &i : arr) {
        cin >> i;
    }

    // Sort
    mergeSort(arr, 0, SIZE);

    // Print array

    for (int &i : arr) {
        cout << i << ' ';
    }

    return 0;
}