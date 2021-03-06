import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:navi/services/localization.dart';
import 'package:navi/pages/drawer/account.dart';
import 'package:navi/pages/drawer/settings.dart';

class SideDrawer extends StatefulWidget {
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  int _selectionIndex = 0;

  _getDrawerItemScreen(int pos) {
    switch (pos) {
      case 1:
        return AccountPage();
      case 2:
        return Settings();
      default:
        return SideDrawer();
    }
  }

  _onSelectItem(int index) {
    setState(() {
      _selectionIndex = index;
      _getDrawerItemScreen(_selectionIndex);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _getDrawerItemScreen(_selectionIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(child: Icon(FontAwesomeIcons.userCircle, size: 70.0)),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text(AppLocalizations.of(context).accountText),
              onTap: () => _onSelectItem(1),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.cogs),
              title: Text(AppLocalizations.of(context).settingsText),
              onTap: () => _onSelectItem(2),
            )
          ],
        ),
      );
  }
}
