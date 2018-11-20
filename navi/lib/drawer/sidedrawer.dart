import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(child: Image.asset('assets/food.jpg')),
          ListTile(
            title: Text('Account'),
            onTap: () {
              Navigator.pushNamed(context, '/account');
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
    );
  }
}
