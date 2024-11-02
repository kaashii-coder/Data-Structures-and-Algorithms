mergeSort(List<String> word) {
  if (word.length <= 1) {
    return word;
  }
  int mid = word.length ~/ 2;
   //! at each iteration/ recursion - first left sorting and right sorting at last merge
  //! recursion will stop when the list become single element 
  return merging(mergeSort(word.sublist(0, mid)), mergeSort(word.sublist(mid)));
}
//! Merging function
merging(List<String> left, List<String> right) {
  int i = 0;
  int j = 0;
  List<String> result = [];
  while (i < left.length && j < right.length) {
    if (left[i].codeUnitAt(0) < right[j].codeUnitAt(0)) {
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
  String name = 'akash maroli';
  
  print(mergeSort(name.split('')));
}
