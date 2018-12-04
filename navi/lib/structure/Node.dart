import 'Egde.dart';

class Node {
  String _UUID;
  List<Egde> _edges = <Egde> [];

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
  void addEdge(final Egde edge) {
    _edges.add(edge);
  }

  /// Add a list of edges to the node
  /// @param edges - the edges to be added
  void addEdges(final List<Egde> edges) {
    _edges.addAll(edges);
  }

  /// Get the edges connected to the node
  /// @return _edges of the node
  List<Egde> getEdges() {
    return _edges;
  }
}
