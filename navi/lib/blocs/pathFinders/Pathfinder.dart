import '../../persistence/dataHandlers/data_manager.dart';
import './pathStructure/AnchorPoint.dart';
import './PriorityQueue.dart';

/// Pathfinder class offers a static method for finding a path between two anchor points.
class Pathfinder {

  /// Finds an optimal path between an anchor point and a target destination.
  /// @param fromAnchorPointID - the UUID of the source anchor point
  /// @param toLocationID - the target location name
  /// @return a list of instructions (in all languages configured) as Strings
  static List<String> findPath(String fromAnchorPointID, String toLocationID){
    var res = DataManager
      .getAnchorPointsFromToGraph(fromAnchorPointID, toLocationID);

    AnchorPoint from = res[0];
    AnchorPoint to = res[1];

    return _modifiedDijkstra(from, to);
  }

  /// Finds the best path between two AnchorPoints in a Graph. Assumes correctly-formed graph, and also that there is a path between the two nodes. Private method.
  /// @param from - the initial AnchorPoint object (node)
  /// @param to -the target AnchorPoint object (node)
  /// @return a list of instructions (in all languages configured) as Strings
  static List<String> _modifiedDijkstra(AnchorPoint from, AnchorPoint to){
    //Visited list
    Set<AnchorPoint> visited = new Set<AnchorPoint>();

    // PriorityQueue<DijkstraNode> priorityNodes = new PriorityQueue<DijkstraNode>();
    PriorityQueue<AnchorPoint> priorityNodes = new PriorityQueue<AnchorPoint>();

    // Start with from node. Add it to visited, create a special node with distance 0 and set it as currentNode
    visited.add(from);
    AnchorPoint currentNode = from;
    currentNode.currentMin = 0;
    int changedFloor = 0;
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
        changedFloor = e.getFromNode().floor - e.getToNode().floor != 0 ? 1 : 0;
        if((e.getFromNode().currentMin + e.distance + changedFloor) < e.getToNode().currentMin){
          e.getToNode().currentMin = e.getFromNode().currentMin + e.distance + changedFloor;
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
