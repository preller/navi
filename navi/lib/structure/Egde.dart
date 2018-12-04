import 'Node.dart';

class Egde {
  Node _fromNode;
  Node _toNode;
  String _instruction;

  /// Constructor
  Egde(final Node fromNode, final Node toNode, final String instruction) {
    _fromNode = fromNode;
    _toNode = toNode;
    _instruction = instruction;
  }

  /// Get the source node
  /// @return _fromNode of the edge
  Node getFromNode() {
    return _fromNode;
  }

  /// Get the destination node
  /// @return _toNode of the edge
  Node getToNode() {
    return _toNode;
  }

  /// Get the instruction associated with the edge
  /// @return _instruction of the edge
  String getInstruction() {
    return _instruction;
  }
}