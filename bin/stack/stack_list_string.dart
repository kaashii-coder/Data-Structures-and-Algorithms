class Stack {
  List<String> stackList = [];
  push(String letter) {
    stackList.add(letter);
  }

  pop() {
    return stackList.removeLast();
  }

  reverseString(String word) {
    for (var i = 0; i < word.length; i++) {
      push(word[i]);
    }
    String rev = '';
    while (stackList.isNotEmpty) {
      rev = rev + pop();
    }
    return rev;
  }

  // removeDuplicates(List<String> list) {
  //   for (var i = 0; i < list.length; i++) {
  //     push(list[i]);
  //   }
  //   removeDuplictesHelper(stackList);
  //   return stackList;
  // }

  // removeDuplictesHelper(List<String> list) {
  //   List<String> temp = [];
  //   if (list.isEmpty) {
  //     return;
  //   }
  //   String top = pop();
  //   if (temp.contains(top)) {
  //     removeDuplictesHelper(list);
  //     push(top);
  //   } else {
  //     removeDuplictesHelper(list);

  //   }
  //   return stackList;
  // }

  display() {
    print(stackList);
  }
}

void main() {
  Stack obj = Stack();
  // obj.push('akash');
  obj.reverseString('akash');
}
