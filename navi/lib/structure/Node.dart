import 'Edge.dart';

class Node implements Comparable{
  String _UUID;
  List<Edge> _edges = <Edge> [];
  int currentMin = 100000;
  // Node currentNextNode = null;
  Node currentPrevNode;


  /// Constructor
  Node(final String id) {
    _UUID = id;
  }

  /// Get the UUID of the node
  /// @return _UUID of the node
  String getUUID() {
    return _UUID;
  }

  /// Add edge to the node
  /// @param edge - the edge to be added
  void addEdge(final Edge edge) {
    _edges.add(edge);
  }

  /// Add a list of edges to the node
  /// @param edges - the edges to be added
  void addEdges(final List<Edge> edges) {
    _edges.addAll(edges);
  }

  // void addEdge(final Edge edge) {
  //   _edges.add(edge);
  //   edge.getToNode().addEdgeDirected(edge)
  // }

  /// Get the edges connected to the node
  /// @return _edges of the node
  List<Edge> getEdges() {
    return _edges;
  }

  @override
  int compareTo(other) {
    return this.currentMin - other.currentMin;
  }

  @override
  String toString(){
    return this._UUID;
  }
}
