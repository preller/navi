import 'package:navi/data/data_manager.dart';
import 'package:navi/structure/Edge.dart';
import 'package:navi/structure/AnchorPoint.dart';
import 'package:navi/support/PriorityQueue.dart';

/// Pathfinder class offers a static method for finding a path between two anchor points.
class Pathfinder {
//TODO take into account floors (add distance if floor is different, or add floor).

  /// Main pathfinder method.
  static List<String> findPath(String fromAnchorPointID, String toLocationID){
    // ASSUMES AL NODES ARE CREATED AGAIN EACH TIME

    // var res = DataManager.getAnchorPointsFromToGraph(fromAnchorPointID: fromAnchorPointID,
    //                                       toLocationID: toLocationID); // anchorPointID and toLocationID are strings (UUID); also return full graph loaded
    var res = Pathfinder.getAnchorPointsFromToGraph(fromAnchorPointID, toLocationID); // anchorPointID and toLocationID are strings (UUID); also return full graph loaded


    // AnchorPoint from = DataManager.getAnchorPoint(anchorPointID: fromAnchorPointID); // anchorPointID is a string (UUID)
    // AnchorPoint to = DataManager.getAnchorPoint(locantionID: toLocationID); // locationID is a String (UUID)
    AnchorPoint from = res[0];
    AnchorPoint to = res[1];

    print(modifiedDijkstra(from, to));
  }

  static List getAnchorPointsFromToGraph(String fromAnchorPointID, String toLocationID){
    // n1 - n2 - n3
    //      -
    //      n4

    AnchorPoint n1 = new AnchorPoint("ID 111");
    AnchorPoint n2 = new AnchorPoint("ID 222");
    AnchorPoint n3 = new AnchorPoint("ID 333");
    AnchorPoint n4 = new AnchorPoint("ID 444");

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

    return [n1, n4];
  }





  static modifiedDijkstra(AnchorPoint from, AnchorPoint to){
    //Visited list
    Set<AnchorPoint> visited = new Set<AnchorPoint>();

    // PriorityQueue<DijkstraNode> priorityNodes = new PriorityQueue<DijkstraNode>();
    PriorityQueue<AnchorPoint> priorityNodes = new PriorityQueue<AnchorPoint>();
    
    // Start with from node. Add it to visited, create a special node with distance 0 and set it as currentNode
    visited.add(from);
    AnchorPoint currentNode = from;
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

    List<String> steps = new List<String>();
    List<AnchorPoint> stepsNodes = new List<AnchorPoint>();
    AnchorPoint current = to;
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

    return steps;
  }

}

main() {
 
  Pathfinder.findPath("111", "222");


}