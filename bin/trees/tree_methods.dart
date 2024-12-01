import 'dart:math' as math;

class Node<T> {
  int data;
  Node<T>? left;
  Node<T>? right;
  Node(this.data);
}

class BinarySearchTree<T> {
  Node<T>? root;

  void insert(int data) {
    Node<T> newNode = Node(data);
    Node<T>? current = root;
    if (current == null) {
      root = newNode;
      return;
    }
    while (true) {
      if (data < current!.data) {
        if (current.left == null) {
          current.left = newNode;
          break;
        } else {
          current = current.left;
        }
      } else {
        if (current.right == null) {
          current.right = newNode;
          break;
        } else {
          current = current.right;
        }
      }
    }
  }

  bool contain(int data) {
    if (root == null) return false;

    Node<T>? current = root;
    while (current != null) {
      if (data < current.data) {
        current = current.left;
      } else if (data > current.data) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }

  delete(int data) {
    root = _deleteRec(root, data);
  }

  Node<T>? _deleteRec(Node<T>? node, int data) {
    if (node == null) return null;
    if (data < node.data) {
      node.left = _deleteRec(node.left, data);
    } else if (data > node.data) {
      node.right = _deleteRec(node.right, data);
    } else {
      if (node.left == null && node.right == null) {
        return null;
      }
      if (node.right == null) {
        return node.left;
      } else if (node.left == null) {
        return node.right;
      }
      int? minLiftdata = _findMindinNode(node.right);
      node.data = minLiftdata!;
      node.right = _deleteRec(node.right, minLiftdata);
    }

    return node;
  }

  int checkBalance(Node<T>? node) {
    if (node == null) return 0;

    int leftHeight = checkBalance(node.left);
    if (leftHeight == -1) return -1;

    int rightHeight = checkBalance(node.right);
    if (rightHeight == -1) return -1;

    if ((leftHeight - rightHeight).abs() > 1) return -1;

    return 1 + math.max(leftHeight, rightHeight);
  }

  int? _findMindinNode(Node<T>? node) {
    while (node?.left != null) {
      node = node!.left;
    }
    return node!.data;
  }

  int fintTargedepth(int target) {
    return _fintTargedepth(root, target);
  }

  int _fintTargedepth(Node<T>? node, int target) {
    int count = 0;
    if (node!.right == null && node.left == null) return 0;
    while (node != null) {
      if (node.data > target) {
        node = node.left;
        count++;
      } else if (node.data < target) {
        node = node.right;
        count++;
      } else {
        count++;
        return count;
      }
    }
    return 0;
  }

  int fintClosetValue(int target) {
    Node<T>? current = root;
    int closetdata = current!.data;
    while (current != null) {
      if ((target - closetdata).abs() > (target - current.data).abs()) {
        closetdata = current.data;
      }
      if (target < current.data) {
        current = current.left;
      } else if (target > current.data) {
        current = current.right;
      } else {
        break;
      }
    }
    return closetdata;
  }

  int getHeight() {
    return _getHeight(root);
  }

  int _getHeight(Node<T>? node) {
    if (node == null) {
      return 0; // If height of empty tree is defined as 0, otherwise use -1
    } else {
      int leftHeight = _getHeight(node.left);
      int rightHeight = _getHeight(node.right);
      return 1 + math.max(leftHeight, rightHeight);
    }
  }

//------------------------------
  inOrder() {
    inOrderHelper(root);
  }

  inOrderHelper(Node<T>? node) {
    if (node != null) {
      inOrderHelper(node.left);
      print(node.data);
      inOrderHelper(node.right);
    }
  }

  //----------------------------
//------------------------------
  preOrder() {
    preOrderHelper(root);
  }

  preOrderHelper(Node<T>? node) {
    if (node != null) {
      print(node.data);
      preOrderHelper(node.left);
      preOrderHelper(node.right);
    }
  }

  //----------------------------
//------------------------------
  postOrder() {
    postOrderHelper(root);
  }

  postOrderHelper(Node<T>? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }
  //----------------------------
}

void main() {
  BinarySearchTree binarySearchTree = BinarySearchTree();

  List<int> datas = [5, 4, 20, 7, 31, 25, 32, 21];
  for (var i in datas) {
    binarySearchTree.insert(i);
  }
  print(binarySearchTree.fintTargedepth(32));
  // print(binarySearchTree.fintClosetValue(200));
  // print(binarySearchTree.contain(4));
  // print(binarySearchTree.getHeight());
  // binarySearchTree.inOrder();
  // print('------ ');
  // binarySearchTree.preOrder();
  // print('------ ');
  // binarySearchTree.postOrder();
}