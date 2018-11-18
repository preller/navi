import 'package:flutter/material.dart';

// import './products.dart';
import './product_create.dart';
import './product_list.dart';

class SettingsPage extends StatelessWidget {
  List<String> tabNames = const<String>[
  'foo', 'bar', 'baz', 'quox', 'quuz', 'corge', 'grault', 'garply', 'waldo'
  ];

  int _screen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is the settings page!'),
      ),
    );
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Manage Products'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(Icons.create),
    //             text: 'Create Product',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.list),
    //             text: 'My Products',
    //           ),
    //         ],
    //       ),
    //     ),

    //     body: TabBarView(
    //       children: <Widget>[ProductCreatePage(), ProductListPage()],
    //     ),
        
        // bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
        //   BottomNavigationBarItem(
        //         icon: Icon(Icons.home), title: Text('Home')),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.business), title: Text('Business'))
        // ],),
    //   ),
    // );
  }
}
