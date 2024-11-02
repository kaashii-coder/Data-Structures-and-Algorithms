mergeSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }
  int mid = list.length ~/ 2;
  //! at each iteration/ recursion - first left sorting and right sorting at last merge
  //! recursion will stop when the list become single element 
  return merging(mergeSort(list.sublist(0, mid)), mergeSort(list.sublist(mid)));
}
//! Merging function
merging(List<int> left, List<int> right) {
  int i = 0;
  int j = 0;
  List<int> result = [];
  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  //! if any side elements is empty add balance all elements
  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
 
  return result;
}

void main() {
  List<int> list = [6, 2, 3, 8, 1, 9, 4, 7, 5];
  print(mergeSort(list));
}
