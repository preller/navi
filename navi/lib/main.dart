import 'package:flutter/material.dart';
import 'package:navi/navi_bloc/blocs/bloc_provider.dart';
import 'package:navi/navi_bloc/blocs/room_bloc.dart';
import 'package:navi/navi_bloc/ui/room.dart';
// import 'package:flutter/rendering.dart';

import './pages/mainpage.dart';
import './drawer/settings.dart';
import './drawer/account.dart';


void main() => runApp(MyApp());

// update MyApp to use the blocprovider but just for rooms as a use case
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc_pattern_tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        bloc: RoomsBloc(),
        child: RoomsPage(),
      ),
    );
  }
}


/*class MyApp extends StatefulWidget {
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
        '/': (BuildContext context) => MainPage(_currentSession),
        '/account': (BuildContext context) => AccountPage(),
        '/settings': (BuildContext context) => SettingsPage(),
      },
    );
  }
}*/
