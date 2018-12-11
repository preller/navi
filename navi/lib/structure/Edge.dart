import 'AnchorPoint.dart';

class Edge {
  AnchorPoint _fromNode;
  AnchorPoint _toNode;
  String _instruction;
  int distance = 1;

  /// Constructor
  Edge(final AnchorPoint fromNode, final AnchorPoint toNode, final String instruction) {
    _fromNode = fromNode;
    _toNode = toNode;
    _instruction = instruction;
  }

  /// Get the source node
  /// @return _fromNode of the edge
  AnchorPoint getFromNode() {
    return _fromNode;
  }

  /// Get the destination node
  /// @return _toNode of the edge
  AnchorPoint getToNode() {
    return _toNode;
  }

  /// Get the instruction associated with the edge
  /// @return _instruction of the edge
  String getInstruction() {
    return _instruction;
  }
}
