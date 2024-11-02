quickSort(List<int> list, int start, int end) {
  if (start < end) {
    int partitionIndex = partition(list, start, end);
    quickSort(list, start, partitionIndex - 1);
    quickSort(list, partitionIndex + 1, end);
  }
  return list;
}
//! partitioning the list and set the element like after pivot bigger than pivot
//! before pivot is smaller than pivot
partition(List<int> list, int start, int end) {
  int pivot = list[end];
  int i = start - 1;
  for (var j = start; j < end; j++) {
    if (list[j] < pivot) {
      i++;
      int temp = list[i];
      list[i] = list[j];
      list[j] = temp;
    }
  }
  int temp = list[i + 1];
  list[i + 1] = pivot;
  list[end] = temp;
  return i + 1;
}

void main() {
  List<int> list = [6, 2, 3, 8, 1, 9, 4, 7, 5];
  print(quickSort(list, 0, list.length - 1));
}
