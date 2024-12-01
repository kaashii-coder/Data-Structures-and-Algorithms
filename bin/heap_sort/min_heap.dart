class Minheap {
   List<int> heap=[];
  

  swaping(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  insert(List array) {
    for (var val in array) {
      heap.add(val);
      heapifyUp(heap.length - 1);
    }
  }

  void heapifyUp(int pos) {
    while (pos > 0) {
      int parent = (pos - 1) ~/ 2;
      if (heap[pos] < heap[parent]) {
        swaping(pos, parent);
        pos = parent;
      } else {
        break;
      }
    }
  }

  deleting() {
    swaping(heap.length - 1, 0);//last element will be swapped by the root element  and then remove last cause if removed first it'll be null which is not allowed
    
    heap.removeLast();
    heapifyDown();
  }

  heapifyDown() {
    int parent = 0;
    var leftchild = parent * 2 + 1;
    var rightchild = parent * 2 + 2;

    while (parent * 2 + 1 < heap.length) {
      var minchild = min(leftchild, rightchild);
      if (heap[minchild] < heap[parent]) {
        swaping(parent, minchild);
        parent = minchild;
      } else {
        break;
      }
      leftchild = parent * 2 + 1;
      rightchild = parent * 2 + 2;
    }
  }

  int min(int i, int j) {
    if (j < heap.length) {
      if (heap[i] < heap[j]) {
        return i;
      } else {
        return j;
      }
    }
    return i;
  }

  sorting() {
    List<int> sorted = [];
    while (heap.isNotEmpty) {
      sorted.add(heap[0]);
      deleting();
    }
    return sorted;
  }
}

void main(List<String> args) {
  Minheap heap = Minheap();
  heap.insert([1, 5, 8, 6, 9, 7]);
  print("${heap.heap}");
  List<int> sorted = heap.sorting();
  print(sorted);
}