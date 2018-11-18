import 'package:flutter/material.dart';

import '../product_manager.dart';
import './welcome.dart';
import './classrooms.dart';

class LandingPage extends StatelessWidget {
  String currentSession = ""; //TODO Should be a Session object
//   // TODO Pass functions as final Function name;?
//   List<String> tabNames = const<String>[
//   'foo', 'bar', 'baz', 'quox', 'quuz', 'corge', 'grault', 'garply', 'waldo'
// ];
  // int _screen = 0;

  LandingPage(this.currentSession);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                DrawerHeader(child: Image.asset('assets/food.jpg')),
                ListTile(
                  title: Text('Account'),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                ListTile(
                  title: Text('Other option'),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
                ListTile(
                  title: Text('Send Feedback'),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Navi'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Welcome'),
                Tab(text: 'Classrooms')
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              WelcomePage(),
              ClassroomsPage()
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
