import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../pathStructure/AnchorPoint.dart';
import '../pathStructure/Edge.dart';

/// DatabaseManager handles all the queries and passes the results back to
/// the DataManager
class DatabaseManager {

  static FirebaseApp _firebaseApp;
  static final FirebaseDatabase _database = FirebaseDatabase(app: _firebaseApp);

  /// Constructor for calling init
  DatabaseManager() {
    init();
  }

  /// Initializes the firebase app configurations
  Future<void> init() async {
    _firebaseApp = await FirebaseApp.configure(
      name: 'navi',
      options: Platform.isIOS
          ? const FirebaseOptions(
              googleAppID: '1:169721566449:ios:25e8b7e7dfa54eaf',
              gcmSenderID: '169721566449',
              databaseURL: 'https://navi-c6d54.firebaseio.com',
            )
          : const FirebaseOptions(
              googleAppID: '1:169721566449:android:25e8b7e7dfa54eaf',
              apiKey: 'AIzaSyBiNEaEovfZu8339Fl-3PgI_7ywFppdrDc',
              databaseURL: 'https://navi-c6d54.firebaseio.com',
            ),
    );
  }

  /// Query all anchor points
  /// @return a map of anchor points
  Future<Map> queryAllAnchorPoints() async {
    Map<String, AnchorPoint> anchorPointsMap = new Map();
    await _database
        .reference()
        .child('anchor')
        .once()
        .then((DataSnapshot snapshot) {
      Map json = jsonDecode(snapshot.value
          .toString()
          .replaceAll('{', '{"')
          .replaceAll(':', '":')
          .replaceAll(', ', ', "')
          .replaceAll('XXX', '"XXX"'));
      for (String key in json.keys) {
        anchorPointsMap.putIfAbsent(key, () => new AnchorPoint(key));
      }
    });
    await _database
        .reference()
        .child('edges')
        .once()
        .then((DataSnapshot snapshot) {
      Map json = jsonDecode(snapshot.value
          .toString()
          .replaceAll('{', '{"')
          .replaceAll(':', '":')
          .replaceAll(', ', ', "'));
      for (String key in json.keys) {
        String fromNodeID = json[key]['fromNode'];
        String toNodeID = json[key]['toNode'];
        anchorPointsMap[fromNodeID].addEdge(new Edge(
            anchorPointsMap[fromNodeID],
            anchorPointsMap[toNodeID],
            'from $fromNodeID to $toNodeID'));
      }
    });
    return anchorPointsMap;
  }

  /// Query all buildings
  /// @return JSON map for all buildings
  Future<Map> queryBuildingList() async {
    Map buildingsJson;
    await _database
        .reference()
        .child('buildings')
        .once()
        .then((DataSnapshot snapshot) {
      buildingsJson = jsonDecode(snapshot.value
          .toString()
          .replaceAll('{', '{"')
          .replaceAll(':', '":')
          .replaceAll(', ', ', "'));
    });
    return buildingsJson;
  }

  /// Query all rooms in a given building
  /// @return JSON map for rooms
  Future<Map> queryRoomsForBuilding(String building) async {
    Map roomsJson;
    await _database
        .reference()
        .child('buildings/$building/members')
        .once()
        .then((DataSnapshot snapshot) {
      roomsJson = jsonDecode(snapshot.value
          .toString()
          .replaceAll('{', '{"')
          .replaceAll(':', '":')
          .replaceAll(', ', ', "'));
    });
    return roomsJson;
  }
}
