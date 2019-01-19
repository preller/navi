import 'package:flutter_test/flutter_test.dart';
import 'package:navi/structure/AnchorPoint.dart';
import 'package:navi/structure/Edge.dart';
import 'package:navi/support/Pathfinder.dart';

void main() {
  
  test('Test the tester', () {
    var answer = 42;
    expect(answer, 42);
  });

  test('Test anchorPoints are created with correct ID', () {
    AnchorPoint node = new AnchorPoint("ID 111");

    expect(node.getUUID(), 'ID 111');
  });

  test('Test edges are added to node correctly', () {
    AnchorPoint node1 = new AnchorPoint("ID 111");
    AnchorPoint node2 = new AnchorPoint("ID 222");

    Edge e12 = new Edge(node1, node2, "from n1 to n2");
    Edge e21 = new Edge(node2, node1, "from n2 to n1");

    node1.addEdges([e12]);

    expect(e12, node1.getEdges()[0]);
  });

  test('Test edge has a correct from node after creation', () {
    AnchorPoint node1 = new AnchorPoint("ID 111");
    AnchorPoint node2 = new AnchorPoint("ID 222");

    Edge e12 = new Edge(node1, node2, "from n1 to n2");
    Edge e21 = new Edge(node2, node1, "from n2 to n1");

    node1.addEdges([e12]);

    expect(e12.getFromNode(), node1);
  });

  test('Test edge has a correct from node after creation', () {
    AnchorPoint node1 = new AnchorPoint("ID 111");
    AnchorPoint node2 = new AnchorPoint("ID 222");

    Edge e12 = new Edge(node1, node2, "from n1 to n2");
    Edge e21 = new Edge(node2, node1, "from n2 to n1");

    node1.addEdges([e12]);

    expect(e12.getToNode(), node2);
  });

  test('Test simple graph pathfinding works as expected', () {
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

    var answer = Pathfinder.modifiedDijkstra(n1, n4);
    List<String> expected = new List<String>();
    expected.addAll(['from n1 to n2', 'from n2 to n4']);

    expect(answer, expected);
  });

  test('Test medium graph pathfinding works as expected', () {
    // n1 - n2 - n3
    //  -   -   -
    // n4 - n5 - n6
    //  -   -   -
    // n7 - n8 - n9

    AnchorPoint n1 = new AnchorPoint("ID 111");
    AnchorPoint n2 = new AnchorPoint("ID 222");
    AnchorPoint n3 = new AnchorPoint("ID 333");
    AnchorPoint n4 = new AnchorPoint("ID 444");
    AnchorPoint n5 = new AnchorPoint("ID 555");
    AnchorPoint n6 = new AnchorPoint("ID 666");
    AnchorPoint n7 = new AnchorPoint("ID 777");
    AnchorPoint n8 = new AnchorPoint("ID 888");
    AnchorPoint n9 = new AnchorPoint("ID 999");

    Edge e12 = new Edge(n1, n2, "from n1 to n2");
    Edge e21 = new Edge(n2, n1, "from n2 to n1");
    Edge e23 = new Edge(n2, n3, "from n2 to n3");
    Edge e32 = new Edge(n3, n2, "from n3 to n2");
    Edge e25 = new Edge(n2, n5, "from n2 to n5");
    Edge e52 = new Edge(n5, n2, "from n5 to n2");
    Edge e14 = new Edge(n1, n4, "from n1 to n4");
    Edge e41 = new Edge(n4, n1, "from n4 to n1");
    Edge e47 = new Edge(n4, n7, "from n4 to n7");
    Edge e74 = new Edge(n7, n4, "from n7 to n4");
    Edge e58 = new Edge(n5, n8, "from n5 to n8");
    Edge e85 = new Edge(n8, n5, "from n8 to n5");
    Edge e69 = new Edge(n6, n9, "from n6 to n9");
    Edge e96 = new Edge(n9, n6, "from n9 to n6");
    Edge e78 = new Edge(n7, n8, "from n7 to n8");
    Edge e87 = new Edge(n8, n7, "from n8 to n7");
    Edge e89 = new Edge(n8, n9, "from n8 to n9");
    Edge e98 = new Edge(n9, n8, "from n9 to n8");
    Edge e36 = new Edge(n3, n6, "from n3 to n6");
    Edge e63 = new Edge(n6, n3, "from n6 to n3");
    Edge e45 = new Edge(n4, n5, "from n4 to n5");
    Edge e54 = new Edge(n5, n4, "from n5 to n4");
    Edge e56 = new Edge(n5, n6, "from n5 to n6");
    Edge e65 = new Edge(n6, n5, "from n6 to n5");

    n1.addEdges([e12, e14]);
    n2.addEdges([e21, e23, e25]);
    n3.addEdges([e32, e36]);
    n4.addEdges([e41, e45, e47]);
    n5.addEdges([e52, e54, e56, e58]);
    n6.addEdges([e63, e65, e69]);
    n7.addEdges([e74, e78]);
    n8.addEdges([e87, e85, e89]);
    n9.addEdges([e98, e96]);

    var answer = Pathfinder.modifiedDijkstra(n1, n9);
    List<String> expected = new List<String>();
    expected.addAll(['from n1 to n2', 'from n2 to n5', 'from n5 to n8', 'from n8 to n9']);

    expect(answer, expected);
  });
}
