class Node {
  int data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;
  void insertion(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node? current = head;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = newNode;
    }
  }

  void printintFunc() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  deleteNthNode(int n) {
    Node? current = head;
    if (n == 1) {
      head = head?.next;
    }
    for (var i = 1; i < n - 1; i++) {
      current = current?.next;
    }
    current?.next = current.next?.next;
  }

  specificNodeDelete(int target) {
    if (head?.data == target && head != null) {
      head = head?.next;
    } else {
      Node? current = head;
      while (current?.next != null) {
        if (current?.next?.data == target) {
          current?.next = current.next?.next;
        } else {
          current = current?.next;
        }
      }
    }
  }

  deleteEvenNode() {
    while (head != null && head!.data % 2 == 0) {
      head = head?.next;
    }
    Node? current = head;
    while (current?.next != null) {
      if (current!.next!.data % 2 == 0) {
        current.next = current.next?.next;
      } else {
        current = current.next;
      }
    }
  }
  
  midNodedelete() {
    Node? previous;
    Node? slow = head;
    Node? fast = head;
    while (fast?.next != null) {
      previous = slow;
      slow = slow?.next;
      fast = fast?.next?.next;
    }
    previous?.next = slow?.next;
  }

  mergeTwoLinkedList(LinkedList list) {
    if (head?.next == null) {
      head?.next = list.head;
    } else {
      Node? current = head;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = list.head;
    }
  }

  sortingFunc() {
    Node? current = head;
    Node? fast = current?.next;

    int temp;
    while (current?.next != null) {
      fast = current?.next;
      while (fast != null) {
        if (current!.data > fast.data) {
          temp = current.data;
          current.data = fast.data;
          fast.data = temp;
        }
        fast = fast.next;
      }
      current = current?.next;
    }
  }
  
}

void main() {
  LinkedList obj = LinkedList();
  obj.insertion(1);
  obj.insertion(2000);
  obj.insertion(3);
  obj.insertion(4000);
  // obj.printintFunc();
  LinkedList obj2 = LinkedList();
  obj2.insertion(10);
  obj2.insertion(20);
  obj2.insertion(300);
  obj2.insertion(400);
  obj.mergeTwoLinkedList(obj2);
  obj.sortingFunc();
  obj.printintFunc();
}
