class Graph {
  Map<int, List<int>> graph = {};

  //this funtion for  easy to make code
  _insert(int data) {
    graph.putIfAbsent(data, () => []);
  }

  void insert(int vertex, int edge, bool isBidirectional) {
    if (!graph.containsKey(vertex)) {
      _insert(vertex);
    }
    if (!graph.containsKey(edge)) {
      _insert(edge);
    }
    graph[vertex]?.add(edge);
    if (isBidirectional) {
      graph[edge]?.add(vertex);
    }
  }

  void printGraph() {
    for (var i in graph.entries) {
      print('${i.key} ${i.value}');
    }
  }

  //deleting a vertex in graph
  delete(int vertex) {
    graph.remove(vertex);
    graph.forEach((key, value) {
      graph[key]!.remove(vertex);
    });
    //print(graph);
  }

  //breadth first search : choose an initial vertex and go through all its edges and then check wheather traversal is completed
  //if not go to next vertex and repeats the same process again
  void bfs(int start) {
    Set<int> visited = {};
    List<int> queue = [start];

    while (queue.isNotEmpty) {
      var current = queue.removeAt(0);

      if (!visited.contains(current)) {
        visited.add(current);
        print(current); // Print or process the node

        for (var neighbor in graph[current]!) {
          if (!visited.contains(neighbor)) {
            queue.add(neighbor);
          }
        }
      }
    }

    // Handle disconnected components
    for (var node in graph.keys) {
      if (!visited.contains(node)) {
        queue.add(node);
        while (queue.isNotEmpty) {
          var current = queue.removeAt(0);
          if (!visited.contains(current)) {
            visited.add(current);
            print(current); // Print or process the node

            for (var neighbor in graph[current]!) {
              if (!visited.contains(neighbor)) {
                queue.add(neighbor);
              }
            }
          }
        }
      }
    }
  }

  void dfs(int start) {
    Set<int> visited = {};
    dfsHelper(start, visited);

    // Handle disconnected components
    for (var node in graph.keys) {
      if (!visited.contains(node)) {
        dfsHelper(node, visited);
      }
    }
  }

  void dfsHelper(int vertex, Set<int> visited) {
    visited.add(vertex);
    print(vertex); // Print or process the node

    for (var neighbor in graph[vertex]!) {
      if (!visited.contains(neighbor)) {
        dfsHelper(neighbor, visited);
      }
    }
  }
}

void main() {
  Graph graph = Graph();

  // Insert edges
  graph.insert(10, 20, true);
  graph.insert(10, 43, false);
  graph.insert(43, 61, false);
  graph.insert(36, 43, false);
  graph.insert(36, 5, false);
  graph.insert(5, 61, false);
  graph.insert(20, 5, false);
  // graph.printGraph();
  // print('object');
  // graph.delete(10);

  // // Print the adjacency list of the graph
  // graph.printGraph();
 // graph.bfs(10);
  print(graph.graph);
}
