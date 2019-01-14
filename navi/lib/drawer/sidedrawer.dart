import 'package:flutter/material.dart';
import 'package:navi/localization.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(child: Image.asset('assets/food.jpg')),
          ListTile(
            title: Text(AppLocalizations.of(context).accountText),
            onTap: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context).settingsText),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          )
        ],
      ),
    );
  }
}
