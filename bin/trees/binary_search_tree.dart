

class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinarySearchTree {
  Node? root;
  insertion(int data) {
    Node newNode = Node(data);
    if (root == null) {
      root = newNode;
      return;
    }
    Node? current = root;
    while (current != null) {
      if (current.data > data) {
        if (current.left == null) {
          current.left = newNode;
          return;
        } else {
          current = current.left;
        }
      } else {
        if (current.right == null) {
          current.right = newNode;
          return;
        } else {
          current = current.right;
        }
      }
    }
  }

  preOrderhelper() {
    preOrder(root);
  }

  preOrder(Node? node) {
    if (node != null) {
      print(node.data);
      preOrder(node.left);
      preOrder(node.right);
    }
  }

  postOrderHelper() {
    postOrder(root);
  }

  postOrder(Node? node) {
    if (node != null) {
      postOrder(node.left);
      postOrder(node.right);
      print(node.data);
    }
  }

  inOrderHelper() {
    inOrder(root);
  }

  inOrder(Node? node) {
    if (node != null) {
      inOrder(node.left);
      print(node.data);
      inOrder(node.right);
    }
  }

  bool contains(int data) {
    Node? current = root;
    while (current != null) {
      if (current.data > data) {
        current = current.left;
      } else if (current.data < data) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }

  deleteHelper(int deleteval) {
    delete(deleteval, root);
  }

  delete(int deleteval, Node? root) {
    if (root == null) {
      return;
    }
    if (root.data > deleteval) {
      root.left = delete(deleteval, root.left);
    } else if (root.data < deleteval) {
      root.right = delete(deleteval, root.right);
    } else {
      if (root.left == null && root.right == null) {
        return null;
      } else if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      } else {
        Node? successor = findMinVal(root.right);
        root.data = successor!.data;
        root.right = delete(deleteval, root);
      }
    }
  }

  findMinVal(Node? root) {
    while (root != null) {
      root = root.left;
    }
    return root;
  }
}

void main() {
  BinarySearchTree obj = BinarySearchTree();
  obj.insertion(48);
  obj.insertion(26);
  obj.insertion(50);
  obj.insertion(11);
  obj.insertion(28);
  obj.insertion(81);
  obj.preOrderhelper();
  obj.deleteHelper(81);
  print(obj.contains(30));
  obj.preOrderhelper();
}
