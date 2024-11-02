class Queue {
  Node? front;
  Node? rear;
  //! Inserting function
  endqueue(int data) {
    Node newNode = Node(data);
    if (front == null) {
      front = newNode;
      rear = newNode;
    } else {
      rear?.next = newNode;
      rear = newNode;
    }
  }
 //! Removing function
  dequeue() {
    front = front?.next;
  }
//! Displaying function
  display() {
    Node? current = front;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

class Node {
  int data;
  Node? next;
  Node(this.data);
}

void main() {
  Queue obj = Queue();
  obj.endqueue(20);
  obj.endqueue(35);
  obj.endqueue(33);
  obj.endqueue(43);
 // obj.display();
  obj.dequeue();
  obj.display();
}
