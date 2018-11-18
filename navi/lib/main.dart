import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/products_admin.dart';
import './pages/landing.dart';
import './pages/product.dart';
import './pages/settings.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products = [];
  String _currentSession = ""; //TODO Should be a Session object

  // To update view, use setState

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrangeAccent),
      routes: {
        '/': (BuildContext context) => LandingPage(_currentSession),
        '/settings': (BuildContext context) => SettingsPage(),
        '/navigator': (BuildContext context) => SettingsPage(),
      },
    );
  }
}
