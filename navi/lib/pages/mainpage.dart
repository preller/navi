import 'package:flutter/material.dart';

import '../drawer/sidedrawer.dart';
import './welcome.dart';
import './classrooms.dart';
import './next.dart';
import './poi.dart';
import './history.dart';

class MainPage extends StatelessWidget {
  String currentSession = ""; //TODO Should be a Session object
//   // TODO Pass functions as final Function name;?
//   List<String> tabNames = const<String>[
//   'foo', 'bar', 'baz', 'quox', 'quuz', 'corge', 'grault', 'garply', 'waldo'
// ];
  // int _screen = 0;

  MainPage(this.currentSession);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          drawer: SideDrawer(),
          appBar: AppBar(
            title: Text('Navi'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Hi!'),
                Tab(text: 'Room'),
                Tab(text: 'Next'),
                Tab(text: 'POI'),
                Tab(text: 'History')
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              WelcomePage(),
              ClassroomsPage(),
              NextPage(),
              PoiPage(),
              HistoryPage()
            ],
          )),
    );
  }
}

// body: new TabBarView(
//     children: new List<Widget>.generate(tabNames.length, (int index) {
//       switch (_screen) {
//         case 0: return new Center(
//           child: new Text('First screen, ${tabNames[index]}'),
//         );
//         case 1: return new Center(
//           child: new Text('Second screen'),
//         );
//       }
//     }),
//   ),
// body: ProductManager(),
// bottomNavigationBar: BottomNavigationBar(
//     items: <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//           icon: Icon(Icons.home), title: Text('Favorites')),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.business), title: Text('Classroom')),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.school), title: Text('School')),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.school), title: Text('School')),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.school), title: Text('School')),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.school), title: Text('School')),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.school), title: Text('School')),
//     ],
//     // currentIndex: _selectedIndex,
//     // fixedColor: Colors.deepPurple,
//     // onTap: _onItemTapped,
//     type: BottomNavigationBarType.fixed,
//   ),
