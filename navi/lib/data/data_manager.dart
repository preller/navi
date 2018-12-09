
import 'package:navi/structure/Edge.dart';
import 'package:navi/structure/Node.dart';

class DataManager {
  static List getAnchorPointsFromToGraph(String fromAnchorPointID, String toLocationID){
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

    return [n1, n4];
  }
}
