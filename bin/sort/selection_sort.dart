void main() {
  List<int> list = [6, 2, 3, 8, 1, 9, 4, 7, 5];
  for (var i = 0; i < list.length; i++) {
    int track = i;
    for (var j = i + 1; j < list.length; j++) {
      if (list[track] > list[j]) {
        track = j;
      }
    }
    int temp = list[i];
    list[i] = list[track];
    list[track] = temp;
  }
  print(list);
}
