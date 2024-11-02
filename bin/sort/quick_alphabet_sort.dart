quickSort(List<String> word, int start, int end) {
  if (start < end) {
    int partitionIndex = partition(word, start, end);
    quickSort(word, start, partitionIndex - 1);
    quickSort(word, partitionIndex + 1, end);
  }
  return word;
}
//! partitioning the list and set the element like after pivot bigger than pivot
//! before pivot is smaller than pivot
partition(List<String> word, int start, int end) {
  int pivot = word[end].codeUnitAt(0);
  int i = start - 1;
  for (var j = start; j < end; j++) {
    if (word[j].codeUnitAt(0) < pivot) {
      i++;
      String temp = word[i];
      word[i] = word[j];
      word[j] = temp;
    }
  }
  String temp = word[i + 1];
  word[i + 1] = word[end];
  word[end] = temp;
  return i + 1;
}

void main() {
  String name = 'akash maroli';
  print(quickSort(name.split(''), 0, name.length - 1));
}
