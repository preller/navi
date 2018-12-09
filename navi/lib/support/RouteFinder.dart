import '../structure/Node.dart';
import '../structure/Edge.dart';
import 'PriorityQueue.dart';

// ASSUMES AL NODES ARE CREATED AGAIN EACH TIME
main() {
  // n1 - n2 - n3
  //      -
  //      n4

  Node n1 = new Node("ID 111");
  Node n2 = new Node("ID 222");
  Node n3 = new Node("ID 333");
  Node n4 = new Node("ID 444");

  Edge e12 = new Edge(n1, n2, "from n1 to n2");
  Edge e21 = new Edge(n2, n1, "from n2 to n1");
  Edge e23 = new Edge(n2, n3, "from n2 to n3");
  Edge e32 = new Edge(n3, n2, "from n3 to n2");
  Edge e24 = new Edge(n2, n4, "from n2 to n4");
  Edge e42 = new Edge(n4, n2, "from n4 to n2");

  n1.addEdge(e12);
  n2.addEdges([e21, e23, e24]);
  n3.addEdge(e32);
  n4.addEdge(e42);

    // print(n1.getEdges()[0].getInstruction());
  // DijkstraNode dn = new DijkstraNode(n1);
  //   // print(dn.currentMin); 
  // dn.currentMin = 1;
  // print(dn.currentMin);

  dijkstra(n1, n4);
}



dijkstra(Node from, Node to){
  Set<Node> visited = new Set<Node>();

  // PriorityQueue<DijkstraNode> priorityNodes = new PriorityQueue<DijkstraNode>();
  PriorityQueue<Node> priorityNodes = new PriorityQueue<Node>();
  


  // Start with from node. Add it to visited, create a special node with distance 0 and set it as currentNode
  visited.add(from);
  Node currentNode = from;
  currentNode.currentMin = 0;
  priorityNodes.add(currentNode);
  // While !finished
  bool finished = false;
  while(!finished){
    // For each neighbour node, if n is not in visited 
    currentNode.getEdges().forEach( (e) {
      // if not in prio list, add it to prio list
      if(!priorityNodes.contains(e.getToNode())){
        priorityNodes.add(e.getToNode());
      }
      // Update the distance and nextNode
      if((e.getFromNode().currentMin + e.distance) < e.getToNode().currentMin){
        e.getToNode().currentMin = e.getFromNode().currentMin + e.distance;
        // e.getFromNode().currentNextNode = e.getToNode();
        e.getToNode().currentPrevNode = e.getFromNode();
      }
      // Add current node to visited
      visited.add(currentNode);
      // Set current node to the smallest one
      currentNode = priorityNodes.removeFirst();
      // If currentNode is node to, finished = true
      if (currentNode == to){
        finished = true;
      }
    });
  }

  // List<String> steps = new List<String>();
  // Node current = from;
  // while(current != null){
  //   current.getEdges().forEach((e){
  //     if(e.getToNode() == current.currentNextNode){
  //       steps.add(e.getInstruction());
  //     }
  //   });
  //   current = current.currentNextNode;
  // }

  // List<String> steps = new List<String>();
  // Node current = to;
  // while(current != null){
  //   current.getEdges().forEach((e){
  //     print("current: " + current.toString());
  //     print("prev: " + current.currentPrevNode.toString());
  //     print("edge from: " + e.getFromNode().toString());
  //     print(e.getFromNode() == current.currentPrevNode);
  //     print('\n');
  //     if(e.getFromNode() == current.currentPrevNode){
  //       steps.add(e.getInstruction());
  //     }
  //   });
  //   print("OUT");
  //   current = current.currentPrevNode;
  // }


  List<String> steps = new List<String>();
  List<Node> stepsNodes = new List<Node>();
  Node current = to;
  while(current != null){
    stepsNodes.add(current);
    current = current.currentPrevNode;
  }
  current = stepsNodes.last;
  stepsNodes = stepsNodes.reversed.toList();
  for(int i = 0; i<stepsNodes.length-1; i++){
    stepsNodes[i].getEdges().forEach((e){
      if(e.getToNode() == stepsNodes[i+1]){
        steps.add(e.getInstruction());
      }
    });

  }

  print(steps);
}



  // Start with from node. Add it to visited, create a special node with distance 0 and set it as currentNode
  // While !finished
    // For each neighbour node, if n is not in visited 
      // if not in added, create a new special node with distance MAX and add it to added list
      // Update the distance and nextNode
      // Add current node to visited
      // Set current node to the smallest one
      // If currentNode is node to, finished = true



  // // Start with from node. Add it to visited and added, create a special node with distance 0 and set it as currentNode
  // visited.add(from);
  // added.add(from);
  // DijkstraNode currentNode = new DijkstraNode(from);
  // currentNode.currentMin = 0;
  // priorityNodes.add(currentNode);
  // // While !finished
  // bool finished = false;
  // while(!finished){
  //   // For each neighbour node, if n is not in visited 
  //   List<Node> currentNeighbours = new List<Node>();
  //   currentNode.node.getEdges().forEach( (e) {
  //     currentNeighbours.add(e.getToNode());
  //   });
  //   currentNeighbours.forEach( (n) {
  //     if(!visited.contains(n)){
  //     // if not in added, create a new special node with distance MAX and add it to added list
  //       if(!added.contains(n)){
  //         priorityNodes.add(new DijkstraNode(n));
  //         added.add(n);
  //       }
  //     // Update the distance and nextNode
  //     if()
  //     // Add current node to visited
  //     // Set current node to the smallest one
  //     }
  //   });
  //   // If currentNode is node to, finished = true





  // currentNode.node.getEdges().forEach( (e) {
  //   if (e.currentNode.currentMin
  //   e.getToNode();
  // });

  
  // print(nodes);


// dijkstra(Node from, Node to){
//   List<Node> unvisited = new List<Node>();
//   Set<Node> visited = new Set<Node>();


//   Node n1 = new Node("ID 111");
//   Node n2 = new Node("ID 222");
//   Node n3 = new Node("ID 333");
//   Node n4 = new Node("ID 444");

//   Edge e12 = new Edge(n1, n2, "from n1 to n2");
//   Edge e21 = new Edge(n2, n1, "from n2 to n1");
//   Edge e23 = new Edge(n2, n3, "from n2 to n3");
//   Edge e32 = new Edge(n3, n2, "from n3 to n2");
//   Edge e24 = new Edge(n2, n4, "from n2 to n4");
//   Edge e42 = new Edge(n4, n2, "from n4 to n2");

//   n1.addEdge(e12);
//   n2.addEdges([e21, e23, e24]);
//   n3.addEdge(e32);
//   n4.addEdge(e42);

//   // Comparator<DijkstraNode> nodeCompare<DijkstraNode>() => (value1, value2) => (value1 as Comparable).compareTo(value2);
//   // (value1 as Comparable).compareTo(value2);

//   PriorityQueue<DijkstraNode> nodes = new PriorityQueue<DijkstraNode>();
  
//   DijkstraNode dn1 = new DijkstraNode(n1);
//   DijkstraNode dn2 = new DijkstraNode(n2);
//   DijkstraNode dn3 = new DijkstraNode(n3);

//   dn1.currentMin = 100;
//   dn2.currentMin = 10;
//   dn3.currentMin = 100;
  
//   nodes.add(dn1);
//   nodes.add(dn2);
//   nodes.add(dn3);
  
//   print(nodes);
// }



// class DijkstraNode implements Comparable{
//   Node node;
//   int currentMin = 100000;
//   DijkstraNode nextNode = null;

//   DijkstraNode(Node n){
//     this.node = n;
//   }

//   @override
//   int compareTo(other) {
//     return this.currentMin - other.currentMin;
//   }

//   @override
//   String toString(){
//     return node.getUUID();
//   }
// }
