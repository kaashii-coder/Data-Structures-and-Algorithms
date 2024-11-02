void main() {
  List<int> arr = [6,1, 9, 4, 8, 2, 5, 3, 7];

  for (var i = 1; i < arr.length; i++) {
    int temp = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > temp) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j+1] = temp;
  }
  print(arr);
}
