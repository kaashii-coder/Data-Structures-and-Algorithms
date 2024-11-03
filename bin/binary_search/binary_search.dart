void main() {
  print(binarySearchFunc(3, [1, 2, 3, 4, 5]));
}
//! binarySearch function
binarySearchFunc(int target, List<int> list) {
  return binaryHelperFunc(target, list, 0, list.length - 1);
}

binaryHelperFunc(int target, List<int> list, int start, int end) {
  if (start <= end) {
    int mid = (start + end) ~/ 2;
    if (list[mid] == target) {
        //! Target value found
      return mid;
    } else if (list[mid] < target) {
      //! Search in the left half
      return binaryHelperFunc(target, list, mid + 1, end);
    } else {
      //! Search in the right half
      return binaryHelperFunc(target, list, start, mid - 1);
    }
  }
}
