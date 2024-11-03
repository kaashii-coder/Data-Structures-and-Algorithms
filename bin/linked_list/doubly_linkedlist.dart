class Node {
  int data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class LinkedList {
  Node? head;
  insertion(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      Node? current = head;
      while (current?.next != null) {
        current = current?.next;
      }
      current?.next = newNode;
      current?.next?.prev = current;
    }
  }

  display() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      //  print(current.prev?.data);
      current = current.next;
    }
  }

  deleteNthNode(int n) {
    if (n <= 1) {
      head = head?.next;
      head?.prev = null;
    } else {
      Node? current = head;
      for (var i = 1; i < n - 1; i++) {
        current = current?.next;
      }
      current?.next = current.next?.next;
      current?.next?.prev = current;
    }
  }

  deleteSpecificNode(int target) {
    if (head?.data == target) {
      head = head?.next;
      head?.prev = null;
    } else {
      Node? current = head;
      while (current?.next != null) {
        if (current?.next?.data == target) {
          current?.next = current.next?.next;
          current?.next?.prev = current;
          
        } else {
          current = current?.next;
        }
      }
    }
  }
 firstAddNode(Node newone) {
    Node? current = head;
    if (head != null) {
      head = newone;
      head?.next = current;
    }
  }
  mergeTwoLinkedList(LinkedList list1) {
    Node? current = head;

    while (current?.next != null) {
      current = current?.next;
    }
    current?.next = list1.head;
    current?.next?.prev = current;
  }

  sortingList() {
    Node? current = head;
    Node? moving = head?.next;
    int temp;
    while (current?.next != null) {
      moving = current?.next;
      while (moving?.next != null) {
        if (current!.data > moving!.data) {
          temp = current.data;
          current.data = moving.data;
          moving.data = temp;
        }
        moving = moving.next;
      }
      current = current?.next;
    }
  }
  oddFindDeleteNextTwoNode() {
    Node? current = head;

    while (current != null) {
      if (current.data % 2 == 1) { 
        
        Node? firstToDelete = current.next;
        Node? secondToDelete = firstToDelete?.next;

      
        current.next = secondToDelete?.next;
      }
      
      current = current.next;
    }
  }
}

void main() {
  LinkedList obj = LinkedList();
  obj.insertion(1);
  obj.insertion(4);
  obj.insertion(3);
  obj.insertion(2);
  // obj.deleteSpecificNode(4);
  // obj.display();
  LinkedList obj2 = LinkedList();
  obj2.insertion(200);
  obj2.insertion(500);
  obj2.insertion(400);
  obj.mergeTwoLinkedList(obj2);
  obj.display();
  obj.sortingList();
  obj.display();
}
