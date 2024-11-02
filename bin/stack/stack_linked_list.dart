class Stack {
  Node? top;
  //! Inserting function
  push(int data) {
    Node newNode = Node(data);
    if (top == null) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }
  //! Removing function

  pop() {
    top = top?.next;
  }
 //! Displaying function
  display() {
    Node? current = top;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

    //! Specific data deleting function
  specificDelete(Stack stack, int specific, Stack secodstack) {
    if (top == null) {
      return;
    }
    if (top?.data == specific) {
      stack.pop();
      return;
    } else {
      secodstack.push(top!.data);
      stack.pop();
      specificDelete(stack, specific, secodstack);
      stack.push(secodstack.top!.data);
      secodstack.pop();
    }
  }
  //! Mid value deleteing function
  midElementDelete(Stack stack, Stack secondstack) {
    Node? current = top;
    int count = 0;
    while (current != null) {
      count++;
      current = current.next;
    }
    int mid = count ~/ 2;
    midtraverser(stack, secondstack, 1, mid);
  }

//! Mid deleting helper function
  midtraverser(Stack stack, Stack secondstack, int currentIndex, int mid) {
    if (currentIndex == mid) {
      stack.pop();
      return;
    } else {
      secondstack.push(top!.data);
      stack.pop();
      midtraverser(stack, secondstack, currentIndex + 1, mid);
      stack.push(secondstack.top!.data);
      secondstack.pop();
    }
  }
 //! Even Nodes Deleting Function
  evenNumberNodeDelete(Stack stack, Stack tempStack) {
    if (top == null) {
      return;
    }
    if (top!.data % 2 == 1) {
      tempStack.push(stack.top!.data);
      stack.pop();
      evenNumberNodeDelete(stack, tempStack);
      stack.push(tempStack.top!.data);
      tempStack.pop();
    } else {
      stack.pop();
      evenNumberNodeDelete(stack, tempStack);
    }
  }
}

class Node {
  int data;
  Node? next;
  Node(this.data);
}

void main() {
  Stack obj = Stack();
  Stack obj2 = Stack();
  obj.push(1);
  obj.push(2);
  obj.push(3);
  obj.push(4);
  obj.push(5);
  obj.push(6);
  //obj.display();
  obj.evenNumberNodeDelete(obj, obj2);
  obj.display();
}
