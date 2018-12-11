import 'package:navi/structure/Edge.dart';
import 'package:navi/structure/AnchorPoint.dart';
import 'database_manager.dart';

import '../structure/AnchorPoint.dart';
import '../structure/Edge.dart';

/// DataManager is acting as a middle layer between the DatabaseManager class
/// and the rest of the modules
class DataManager {

  static DatabaseManager _databaseManager = new DatabaseManager();

  /// Create a graph and return a list of from and to anchor points
  /// @param fromAnchorPointID - the UUID of the source anchor point
  /// @param toLocationID - the UUID of the destination
  /// @return a list of 2 anchor points (from, to)
  static Future<List<AnchorPoint>> createGraphAndGetAnchorPointsFromTo(
      String fromAnchorPointID, toLocationID) async {
    Map anchorPointsMap = await _databaseManager.queryAllAnchorPoints();
    return [anchorPointsMap[fromAnchorPointID], anchorPointsMap[toLocationID]];
  }

  /// Get a list of buildings
  /// @return list of buildings IDs
  static Future<List<String>> getBuildings() async {
    List<String> buildingsList = new List();
    Map buildingsJson = await _databaseManager.queryBuildingList();
    for (String key in buildingsJson.keys) {
      buildingsList.add(key);
    }
    return buildingsList;
  }

  /// Get a list of rooms for a given building
  /// @return list of rooms IDs
  static Future<List<String>> getRoomsForBuilding(String building) async {
    List<String> roomsList = new List();
    Map roomsJson = await _databaseManager.queryRoomsForBuilding(building);
    for (String key in roomsJson.keys) {
      roomsList.add(key);
    }
    return roomsList;
  }

  /// Temporal hard coded graph
  static List getAnchorPointsFromToGraph(
      String fromAnchorPointID, String toLocationID) {
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
}
